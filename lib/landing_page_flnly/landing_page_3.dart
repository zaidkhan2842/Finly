import 'package:flutter/material.dart';
import 'package:flutter_application_1/landing_page_flnly/landing_page_4.dart';

class LandingPage3 extends StatefulWidget {
  const LandingPage3({super.key});

  @override
  State<LandingPage3> createState() => _LandingPage3State();
}

class _LandingPage3State extends State<LandingPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              // ---------------- TOP BAR ----------------
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1EEF2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 21,
                        color: Color(0xFF29282B),
                      ),
                    ),
                  ),

                  // 03 / 04
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EDF2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF29B8EA),
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 7),

                        const Text(
                          "03 / 04",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF353338),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Skip
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login_page');
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF343238),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ---------------- IMAGE CARD ----------------
              Container(
                width: double.infinity,
                height: 320,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE9DC),
                  borderRadius: BorderRadius.circular(15),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Your illustration
                    Center(
                      child: Image.asset(
                        "assets/images/Precision Target Visual.png",
                        width: 288,
                        height: 288,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Forecast label
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),

                        height: 30,
                        width: 127,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.show_chart,
                              size: 15,
                              color: Color(0xFF087A9F),
                            ),

                            SizedBox(width: 4),

                            Text(
                              "Forecast On Point",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                                color: Color(0XFF1b1b1e),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Budget badge
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 8,
                        ),

                        height: 36,
                        width: 180,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB5F25B),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: const Text(
                          "🎯 Under Budget by 18%",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.24,
                            color: Color(0XFF4b6d00),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- BLUE BADGE ----------------
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4F3FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_graph, size: 13, color: Color(0xFF087A9F)),

                    SizedBox(width: 5),

                    Text(
                      "SMART FORECASTING",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004c69),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // ---------------- TITLE ----------------
              const Text(
                "Hit Your Financial Targets\nwith Ease",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.7,
                  color: Color(0xFF1b1b1e),
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- DESCRIPTION ----------------
              const Text(
                "Custom category budgets and intelligent alerts\n"
                "keep you spending on track before you\n"
                "overspend.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF3e484f),
                ),
              ),

              const SizedBox(height: 16),

              // ---------------- FEATURE BOX ----------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Icon circle
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDFF5FF),
                        shape: BoxShape.circle,
                      ),

                      child: Image.asset('assets/images/Background.png'),
                    ),

                    const SizedBox(width: 10),

                    // Text
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Auto-Balancing Engine",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.24,
                              color: Color(0xFF1b1b1e),
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            "Real-time spend reallocations",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.12,
                              color: Color(0xFF3e484f),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Color(0xFFB9B6BB),
                    ),
                  ],
                ),
              ),

              // ---------------- PAGE DOTS ----------------
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_dot(false), _dot(false), _dot(true), _dot(false)],
              ),

              const SizedBox(height: 50),

              // ---------------- CONTINUE BUTTON ----------------
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoaderPage4(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF29282B),
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.14,
                          color: Color(0xFFf3f0f4),
                        ),
                      ),

                      SizedBox(width: 7),

                      Icon(Icons.arrow_forward, size: 17),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- PREVIOUS STEP ----------------
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to Previous Step",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.24,
                    color: Color(0xFF3e484f),
                  ),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- DOT FUNCTION ----------------

  Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 28 : 7,
      height: 7,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF27B7E8) : const Color(0xFFE0DDE1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
