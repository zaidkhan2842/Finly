import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/landing_page_flnly/landing_page_1.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,

          child: ClipRect(
            child: Stack(
              children: [
                // Green circle: bottom-right
                Positioned(
                  bottom: 250,
                  right: -70,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      width: 320,
                      height: 320,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFc4ecd0),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: -10,
                  left: -10,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      width: 280,
                      height: 280,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFd4ecfc),
                      ),
                    ),
                  ),
                ),

                // Screen content, on top of the circle
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 48,
                                  left: 16,
                                ),
                                width: 87,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF6F2F7),
                                  borderRadius: BorderRadius.circular(15),
                                ),

                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFBCF063),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ), // gap between icon and text
                                      const Text(
                                        "Live Sync",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF3E484F),
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 48,
                                  right: 16,
                                ),
                                width: 87,
                                height: 30,

                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/Container.svg',
                                      ),

                                      const SizedBox(
                                        width: 4,
                                      ), // gap between icon and text
                                      const Text(
                                        "256-BIT SSL",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF3E484F),
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 80),

                          Image.asset(
                            'assets/images/Squircle Elevated Logo Container (1).png',
                          ),

                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // shrink the Row to fit its children
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Finly",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF1b1b1e),
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    bottom: 4,
                                  ),
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff00668A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Personal Finance, Effortlessly Simple",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3e484f),
                              letterSpacing: 0,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Container(
                                width: 130,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFffffff),
                                  borderRadius: BorderRadius.circular(15),
                                ),

                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/Icon.svg',
                                        width: 12,
                                        height: 12,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ), // gap between icon and text
                                      const Text(
                                        "instant Track",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF3E484F),
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                width: 130,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    253,
                                    251,
                                    253,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),

                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/Icon (1).svg',
                                        width: 12,
                                        height: 12,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ), // gap between icon and text
                                      const Text(
                                        "Smart Budgets",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF3E484F),
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 150),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // centers "hiii" and the row
                              children: [
                                TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1.0),
                                  duration: const Duration(seconds: 20),
                                  onEnd: () {
                                    // runs once, exactly when the 10 seconds finish
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const LoaderPage1(),
                                      ),
                                    );
                                  },
                                  builder: (context, value, child) {
                                    return Container(
                                      width: 144,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE8E8E8),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: value,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF087A9F),
                                                Color(0xFF20B7E8),
                                                Color(0xFF9BE34D),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(height: 16),
                                Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min, // shrink Row so Center can center it
                                      children: [
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF00668a),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF00668a)
                                                .withValues(alpha: 0.6),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Container(
                                          child: const Text(
                                            "Encrypting local vault...",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF3E484F),
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize:
                                  MainAxisSize.min, // centers "hiii" and the ro
                              children: [
                                Center(
                                  child: Text(
                                    "v2.4.0",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6e7980),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 4,
                                  height: 4,

                                  decoration: BoxDecoration(
                                    color: Color(0XFFbdc8d1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Center(
                                  child: Icon(
                                    Icons.verified_user, // shield with check
                                    color: Color(0xFF2E9E3F), // green
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Center(
                                  child: Text(
                                    "Secured by Finly Cloud",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6e7980),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
