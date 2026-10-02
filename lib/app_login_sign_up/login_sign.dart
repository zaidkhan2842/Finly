import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// "Welcome to Finly" sign-in screen.
/// Optional: add Plus Jakarta Sans to pubspec.yaml as 'PlusJakartaSans'.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _googleReady = false;

  Future<void> signInWithGoogle() async {
    try {
      if (!_googleReady) {
        await GoogleSignIn.instance.initialize(
          // Android needs your WEB client ID from Google Cloud / Firebase
          serverClientId: '682568989920-ons0j5me8tiv1u8c8frd0q6gdteg9h0h.apps.googleusercontent.com',
        );
        _googleReady = true;
      }

      final GoogleSignInAccount user = await GoogleSignIn.instance
          .authenticate();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/Home_apk');
      print("Name: ${user.displayName}");
      print("Gmail: ${user.email}");
      print("Photo: ${user.photoUrl}");
    } on GoogleSignInException catch (e) {
      print("Google Sign-In Error: ${e.code} ${e.description}");
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  Future<void> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print("User ID: ${credential.userIdentifier}");
      print("Email: ${credential.email}");
      print("Name: ${credential.givenName} ${credential.familyName}");
      print("Token: ${credential.identityToken}");
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        print("User cancelled");
      } else {
        print("Apple Sign-In Error: ${e.code} ${e.message}");
      }
    } catch (e) {
      print("Apple Sign-In Error: $e");
    }
  }

  static const _bg = Color(0xFFF8F7FB);
  static const _text = Color(0xFF1b1b1e);
  static const _muted = Color(0xFF3e484f);
  static const _field = Color(0xFFF4F1F8);
  static const _dark = Color(0xFF303033);
  static const _teal = Color(0xFF0B6E8E);
  static const _green = Color(0xFFBCF063);
  static const _greenSoft = Color(0xFFE6F5C8);
  static const _greenText = Color(0xFF2F5200);
  static const _font = 'PlusJakartaSans';

  final _email = TextEditingController(text: 'john.mercer@example.com');
  final _password = TextEditingController(text: 'supersecret123');
  bool _obscure = false;
  bool _signIn = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  TextStyle _t(
    double size,
    FontWeight w,

    Color c, {
    double? height,
    double? spacing,

    TextDecoration? deco,
  }) => TextStyle(
    fontFamily: _font,
    fontSize: size,
    fontWeight: w,

    color: c,
    height: height,
    letterSpacing: spacing,
    decoration: deco,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          // soft background glows
          _glow(top: -60, left: -80, size: 320, color: const Color(0xFFBFE3FA)),
          _glow(
            top: 190,
            right: -120,
            size: 320,
            color: const Color(0xFFDDF3B8),
          ),
          _glow(
            bottom: -60,
            left: 40,
            size: 300,
            color: const Color(0xFFFDE3D2),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(21, 16, 21, 24),
              child: Column(
                children: [
                  _logo(),
                  const SizedBox(height: 18),
                  Text(
                    'Welcome to Finly',
                    style: _t(28, FontWeight.w700, _text, spacing: -.7),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage, track, and grow your wealth\neffortlessly.',
                    textAlign: TextAlign.center,
                    style: _t(
                      14,
                      FontWeight.w500,
                      Color(0xff3e484f),
                      height: 1.5,
                      spacing: 0,
                    ),
                  ),
                  const SizedBox(height: 26),
                  _tabs(),
                  const SizedBox(height: 22),
                  _formCard(),
                  const SizedBox(height: 18),
                  _infoRow(),
                  const SizedBox(height: 10),
                  _divider(),
                  const SizedBox(height: 14),
                  _socialButtons(),
                  const SizedBox(height: 18),
                  _faceId(),
                  const SizedBox(height: 18),
                  _terms(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Background glow ──────────────────────────────────────────
  Widget _glow({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required Color color,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color.withOpacity(.75), color.withOpacity(0)],
            ),
          ),
        ),
      ),
    );
  }

  // ── Logo circle (put your logo inside if you have one) ──────
  Widget _logo() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3C325A).withOpacity(.12),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Image.asset('assets/images/Finly Logo.png'),
      // child: Image.asset('assets/images/logo.png'),
    );
  }

  // ── Sign In / Create Account segmented control ───────────────
  Widget _tabs() {
    Widget tab(String label, bool active) => Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _signIn = label == 'Sign In'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: _t(
              13,
              FontWeight.w700,
              active ? _text : _text.withOpacity(.65),
            ),
          ),
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEBF2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [tab('Sign In', _signIn), tab('Create Account', !_signIn)],
      ),
    );
  }

  // ── Form card ────────────────────────────────────────────────
  Widget _formCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3C325A).withOpacity(.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EMAIL ADDRESS',
            style: _t(10, FontWeight.w800, _muted, spacing: .5),
          ),
          const SizedBox(height: 8),
          _input(
            controller: _email,
            icon: Icons.mail_outline,
            keyboard: TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),
          Text('PASSWORD', style: _t(10, FontWeight.w800, _muted, spacing: .8)),
          const SizedBox(height: 8),
          _input(
            controller: _password,
            icon: Icons.lock_outline,
            obscure: _obscure,
            suffix: IconButton(
              splashRadius: 18,
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(
                _obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20,
                color: _muted,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot Password?',
                style: _t(12, FontWeight.w700, _teal),
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Home_apk');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _dark,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: const StadiumBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In to Finly',
                    style: _t(14, FontWeight.w800, Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
    TextInputType? keyboard,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 16, right: 6),
      decoration: BoxDecoration(
        color: _field,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: _muted),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              keyboardType: keyboard,
              style: _t(14, FontWeight.w500, _text),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (suffix != null) suffix,
        ],
      ),
    );
  }

  // ── "Zero commissions" info row ──────────────────────────────
  Widget _infoRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EEF5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE8E5EE),
              shape: BoxShape.circle,
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/Smart financial highlights preview.png',
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(radius: 3, backgroundColor: _green),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Zero commissions on smart vaults',
                        style: _t(12, FontWeight.w700, _text, spacing: 0.24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  'Automate daily roundups & passive yield safely',
                  style: _t(12, FontWeight.w500, _muted, spacing: 0.12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── "or continue with" divider ───────────────────────────────
  Widget _divider() {
    return Row(
      children: [
        Expanded(child: Divider(color: _muted.withOpacity(.2), height: 1)),
        Container(
          decoration: const BoxDecoration(color: Color(0xffFBF8FC)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Text(
              'or continue with',
              style: _t(10, FontWeight.w700, Color(0xff6e7980)),
            ),
          ),
        ),
        Expanded(child: Divider(color: _muted.withOpacity(.2), height: 1)),
      ],
    );
  }

  // ── Apple / Google buttons ───────────────────────────────────
  Widget _socialButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: signInWithApple,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                gradient: const LinearGradient(
                  colors: [Color(0xFF2F2F33), Color(0xFF6B6870)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.apple, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text('Apple', style: _t(13, FontWeight.w700, Colors.white)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: GestureDetector(
            onTap: signInWithGoogle,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                gradient: const LinearGradient(
                  colors: [Colors.white, Color(0xFFFFF1E6)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset(
                    'assets/images/channels4_profile.jpg',
                    height: 25,
                    width: 25,
                  ),

                  const SizedBox(width: 8),

                  Text('Google', style: _t(13, FontWeight.w700, _text)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Face ID chip ─────────────────────────────────────────────
  Widget _faceId() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: _greenSoft,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.face, size: 18, color: _greenText),
          const SizedBox(width: 6),
          Text(
            'Sign in with Face ID',
            style: _t(12, FontWeight.w700, _greenText, spacing: 0.24),
          ),
        ],
      ),
    );
  }

  // ── Terms text ───────────────────────────────────────────────
  Widget _terms() {
    final base = _t(11.5, FontWeight.w500, _muted, height: 1.6);
    final link = base.copyWith(
      color: _text,
      fontWeight: FontWeight.w800,
      decoration: TextDecoration.underline,
    );
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          const TextSpan(text: "By continuing, you agree to Finly's "),
          TextSpan(text: 'Terms of\nService', style: link),
          const TextSpan(text: ' & '),
          TextSpan(text: 'Privacy Policy', style: link),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
