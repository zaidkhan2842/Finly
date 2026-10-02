import 'package:flutter/material.dart';

class LoaderPage4 extends StatefulWidget {
  const LoaderPage4({super.key});

  @override
  State<LoaderPage4> createState() => _LoaderPage4State();
}

class _LoaderPage4State extends State<LoaderPage4> {
  static const Color _dark = Color(0xFF2B2B2E);
  static const Color _blue = Color(0xFF38B6F5);
  static const Color _bg = Color(0xFFF8F7FB);

  // ---------- Navigation (stack route) ----------
  void _goBack() => Navigator.of(context).pop();

  void _skip() {
    // TODO: go to home / login
    Navigator.of(context).pushReplacementNamed('/login_page');
  }

  void _getStarted() {
    // TODO: go to home / login
    Navigator.of(context).pushReplacementNamed('/login_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    _buildHeroCard(),
                    const SizedBox(height: 22),
                    _buildGuaranteeTag(),
                    const SizedBox(height: 14),
                    const Text(
                      'Your Money & Data,\nAlways Protected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1C1C1E),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Connect your accounts with complete peace of mind. '
                        'We utilize bank-grade encryption and never sell your '
                        'personal data.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          height: 1.5,
                          color: Color(0xFF4A4A4F),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildDots(),
                    const SizedBox(height: 160),
                    _buildBottom(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Top bar: back | 04 / 04 | skip ----------
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: _goBack,
            customBorder: const CircleBorder(),
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xFFEDEBF1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, size: 20, color: _dark),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEBF1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 13, color: Color(0xFF8E8E93)),
                children: [
                  TextSpan(
                    text: '04',
                    style: TextStyle(
                      color: Color(0xFF0F6E8C),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: '  /  04'),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: _skip,
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B6B70),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Hero card (no image, just floating chips) ----------
  Widget _buildHeroCard() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              height: 380,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE6E3DC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset("assets/images/lock.png"),
            ),
          ),
          // Top-left: Security chip
          Positioned(
            top: 0,
            left: -6,
            child: _floatingChip(
              padding: const EdgeInsets.fromLTRB(10, 8, 16, 8),
              radius: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2B2B2E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SECURITY',
                        style: TextStyle(
                          fontSize: 9,
                          letterSpacing: 0.6,
                          color: Color(0xFF8E8E93),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '256-Bit AES',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Bottom-right: Biometrics chip
          Positioned(
            bottom: 24,
            right: 0,
            child: _floatingChip(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
              radius: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB6F24A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 18,
                      color: _dark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Biometrics',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Protected &\nLive',
                        style: TextStyle(
                          fontSize: 10.5,
                          height: 1.2,
                          color: Color(0xFF6B6B70),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Bottom-left: Finly Vault chip
          Positioned(
            bottom: 8,
            left: 22,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified_user, size: 12, color: Color(0xFF1B7FB0)),
                  SizedBox(width: 5),
                  Text(
                    'Finly Vault™',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingChip({
    required Widget child,
    required EdgeInsets padding,
    required double radius,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // ---------- "ZERO DATA RESALE GUARANTEE" tag ----------
  Widget _buildGuaranteeTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFD9F5A5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified, size: 13, color: Color(0xFF2F5D0F)),
          SizedBox(width: 6),
          Text(
            'ZERO DATA RESALE GUARANTEE',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: Color(0xFF2F5D0F),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Page indicator dots (4th active) ----------
  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) {
        final bool active = i == 3;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? _blue : const Color(0xFFDAD8E0),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  // ---------- Bottom: Get Started Now + trusted by ----------
  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _getStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: _dark,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started Now',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _avatar('A', const Color(0xFFCDEBFA), 0),
              _avatar('M', const Color(0xFFC9F27A), -6),
              _avatar('K', const Color(0xFFFFE0C2), -12),
              const SizedBox(width: 4),
              const Text(
                'Trusted by over ',
                style: TextStyle(fontSize: 11.5, color: Color(0xFF6B6B70)),
              ),
              const Text(
                '250,000+',
                style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700),
              ),
              const Text(
                ' happy savers',
                style: TextStyle(fontSize: 11.5, color: Color(0xFF6B6B70)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _avatar(String letter, Color color, double shift) {
    return Transform.translate(
      offset: Offset(shift, 0),
      child: Container(
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: _bg, width: 1.5),
        ),
        child: Text(
          letter,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
