import 'package:flutter/material.dart';
import 'package:flutter_application_1/landing_page_flnly/landing_page_2.dart';

/// Onboarding screen 1 – "Take Control of Your Finances Effortlessly"
/// Optional: add the Plus Jakarta Sans font in pubspec.yaml under the
/// family name 'PlusJakartaSans' for an exact match with the design.
class LoaderPage1 extends StatelessWidget {
  const LoaderPage1({super.key});

  static const _bg = Color(0xFFF8F7FB);
  static const _text = Color(0xFF16141C);
  static const _muted = Color(0xFF5B5866);
  static const _chip = Color(0xFFFDE3C8);
  static const _chipText = Color(0xFF3A2A14);
  static const _blue = Color(0xFF38BDF8);
  static const _blueSoft = Color(0xFFCFE8F8);
  static const _green = Color(0xFFC6F27A);
  static const _greenSoft = Color(0xFFE3F5C4);
  static const _greenText = Color(0xFF2F5200);
  static const _pill = Color(0xFFEEEDF3);
  static const _dot = Color(0xFFDDDBE4);
  static const _font = 'PlusJakartaSans';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(21, 10, 21, 20),
                  child: Column(
                    children: [
                      _topBar(context),
                      const SizedBox(height: 24),
                      _hero(),
                      const SizedBox(height: 22),
                      _title(),
                      const SizedBox(height: 14),
                      const Text(
                        'Track every penny, categorize expenses automatically, '
                        'and gain deep visibility into your daily spending.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: _font,
                          fontSize: 15.5,
                          height: 23 / 15.5,
                          fontWeight: FontWeight.w500,
                          color: _muted,
                        ),
                      ),

                      const SizedBox(height: 24),
                      _dots(),
                      const SizedBox(height: 16),
                      _continueButton(context),
                      const SizedBox(height: 12),
                      const Text(
                        'No credit card required • Takes 1 minute',
                        style: TextStyle(
                          fontFamily: _font,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF3e484f),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Top bar: step counter + Skip ─────────────────────────────
  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _pill,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(radius: 3, backgroundColor: _blue),
              SizedBox(width: 8),
              Text(
                '01 / 04',
                style: TextStyle(
                  fontFamily: _font,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _text,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/login_page');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: _pill,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(
                fontFamily: _font,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _text,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Hero card ────────────────────────────────────────────────
  Widget _hero() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),

      child: AspectRatio(
        aspectRatio: 309 / 311,

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 253, 251, 251), _bg],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3C325A).withOpacity(.16),
                blurRadius: 34,
                offset: const Offset(0, 14),
              ),
              BoxShadow(
                color: _green.withOpacity(.5),
                blurRadius: 36,
                spreadRadius: -14,
                offset: const Offset(24, 26),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/3D stylized finance card floating with trend graph.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(top: -8, right: -14, child: _blob(130, _greenSoft)),
                Positioned(bottom: 20, left: -14, child: _blob(100, _blueSoft)),
                Positioned(top: 16, left: 16, child: _realtimeTag()),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 14,
                  child: _growthPill(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _blob(double size, Color color) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );

  Widget _realtimeTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _chip,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.auto_awesome, size: 12, color: _chipText),
          SizedBox(width: 5),
          Text(
            'Real-time',
            style: TextStyle(
              fontFamily: _font,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: _chipText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _growthPill() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3C325A).withOpacity(.12),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: _green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.trending_up, size: 16, color: _greenText),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Growth this week',
                style: TextStyle(
                  fontFamily: _font,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: _muted,
                ),
              ),
              Text(
                '+10.08%',
                style: TextStyle(
                  fontFamily: _font,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: _greenText,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: _green,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'PROMO',
              style: TextStyle(
                fontFamily: _font,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: .5,
                color: _greenText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Headline with highlighted "Finances" ─────────────────────
  Widget _title() {
    const style = TextStyle(
      fontFamily: _font,
      fontSize: 28,
      height: 38 / 28,
      fontWeight: FontWeight.w800,
      letterSpacing: -.5,
      color: _text,
    );
    return Column(
      children: [
        const Text('Take Control of Your', style: style),
        Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: _chip,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Finances', style: style.copyWith(color: _chipText)),
              const SizedBox(width: 4),
              const Icon(Icons.verified_outlined, size: 18, color: _chipText),
            ],
          ),
        ),
        const Text('Effortlessly', style: style),
      ],
    );
  }

  // ── Pagination dots ──────────────────────────────────────────
  Widget _dots() {
    Widget dot(bool active) => AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: active ? 32 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: active ? _blue : _dot,
        borderRadius: BorderRadius.circular(99),
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [dot(true), dot(false), dot(false), dot(false)],
    );
  }

  // ── Continue button ──────────────────────────────────────────
  Widget _continueButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: _blue.withOpacity(.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LandingPage2()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _blue,
          foregroundColor: const Color(0xFF0B2233),
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Continue',
              style: TextStyle(
                fontFamily: _font,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF004965),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}
