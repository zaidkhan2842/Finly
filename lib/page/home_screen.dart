import 'package:flutter/material.dart';

/// Finly dashboard – balance card, income/expense, quick actions,
/// horizontally scrolling Financial Highlights, recent transactions
/// and a floating bottom bar.
class FinanceApp extends StatefulWidget {
  const FinanceApp({super.key});

  @override
  State<FinanceApp> createState() => _FinanceAppState();
}

class _FinanceAppState extends State<FinanceApp> {
  static const _bg = Color(0xFFF8FAFF);
  static const _text = Color(0xFF1B1B1E);
  static const _muted = Color(0xFF5B6770);
  static const _blue = Color(0xFF38BDF8);
  static const _green = Color(0xFFE3F5C4);
  static const _greenDark = Color(0xFF2F5200);
  static const _peach = Color(0xFFFDE3D2);
  static const _navy = Color(0xFF111827);
  static const _font = 'PlusJakartaSans';

  // Both highlight cards share this width.
  static const double _highlightW = 250;

  int _period = 0; // 0 Week, 1 Month, 2 Year
  int _nav = 0;

  TextStyle _t(
    double size,
    FontWeight w,
    Color c, {
    double? height,
    double? spacing,
  }) => TextStyle(
    fontFamily: _font,
    fontSize: size,
    fontWeight: w,
    color: c,
    height: height,
    letterSpacing: spacing,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        _header(),
                        const SizedBox(height: 18),
                        _balanceCard(),
                        const SizedBox(height: 14),
                        _incomeExpense(),
                        const SizedBox(height: 22),
                        _quickActions(),
                        const SizedBox(height: 26),
                        _sectionHeader('Financial Highlights', 'View All'),
                        const SizedBox(height: 14),
                      ],
                    ),
                  ),
                  _highlights(), // scrolls left / right
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 26),
                        _sectionHeader(
                          'Recent Transactions',
                          'Today',
                          actionColor: _muted,
                        ),
                        const SizedBox(height: 14),
                        _txn(
                          icon: Icons.restaurant,
                          iconBg: const Color(0xFFFFF1E6),
                          iconColor: const Color(0xFFE8883A),
                          title: 'BBQ',
                          sub: 'Dinner with friends',
                          amount: '-\$64.00',
                        ),
                        _txn(
                          icon: Icons.local_taxi_outlined,
                          iconBg: const Color(0xFFE3F5E9),
                          iconColor: const Color(0xFF2E9E5B),
                          title: 'Careem Ride',
                          sub: 'Office commute',
                          amount: '-\$14.20',
                        ),
                        _txn(
                          label: 'ZARA',
                          iconBg: const Color(0xFFEDEEF2),
                          iconColor: _text,
                          title: 'Zara',
                          sub: 'Shopping clothing',
                          amount: '-\$128.50',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 16, right: 16, bottom: 16, child: _bottomBar()),
        ],
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────────
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning,', style: _t(12, FontWeight.w500, _muted)),
            const SizedBox(height: 2),
            Text(
              'John Mercer',
              style: _t(24, FontWeight.w800, _text, spacing: -.5),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text('A', style: _t(14, FontWeight.w700, _text)),
        ),
      ],
    );
  }

  // ── Balance card with Week / Month / Year and bar chart ──────
  Widget _balanceCard() {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const heights = <double>[36, 46, 56, 64, 80, 0, 42];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3DB9F7), Color(0xFF1C9CEB)],
        ),
        boxShadow: [
          BoxShadow(
            color: _blue.withOpacity(.35),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL BALANCE',
                style: _t(10, FontWeight.w700, Colors.white70, spacing: .8),
              ),
              _periodSwitch(),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '\$ 42,020',
            style: _t(34, FontWeight.w800, Colors.white, spacing: -.5),
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.white.withOpacity(.25), height: 1),
          const SizedBox(height: 12),
          SizedBox(
            height: 112,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 30,
                      height: heights[i],
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(i == 4 ? .6 : .35),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      days[i],
                      style: _t(
                        10,
                        i == 5 ? FontWeight.w800 : FontWeight.w500,
                        i == 5 ? Colors.white : Colors.white70,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _periodSwitch() {
    const labels = ['Week', 'Month', 'Year'];
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.25),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: List.generate(3, (i) {
          final active = _period == i;
          return GestureDetector(
            onTap: () => setState(() => _period = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: active ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                labels[i],
                style: _t(
                  10,
                  FontWeight.w700,
                  active ? const Color(0xFF1C9CEB) : const Color(0xffffffff),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Income / Expense ─────────────────────────────────────────
  Widget _incomeExpense() {
    Widget box(Color bg, IconData icon, String label, String value) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 18, color: _text),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: _t(11, FontWeight.w500, _muted)),
                  const SizedBox(height: 2),
                  Text(value, style: _t(15, FontWeight.w800, _text)),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        box(_green, Icons.south_west, 'Income', '\$ 60,500'),
        const SizedBox(width: 12),
        box(_peach, Icons.north_east, 'Expense', '\$ 25,480'),
      ],
    );
  }

  // ── Quick actions ────────────────────────────────────────────
  Widget _quickActions() {
    Widget item(IconData icon, String label) => Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, size: 22, color: _text),
        ),
        const SizedBox(height: 8),
        Text(label, style: _t(11, FontWeight.w600, _muted)),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        item(Icons.swap_vert, 'Transfer'),
        item(Icons.add, 'Receive'),
        item(Icons.receipt_long_outlined, 'Bills'),
        item(Icons.pie_chart_outline, 'Insights'),
      ],
    );
  }

  // ── Section header ───────────────────────────────────────────
  Widget _sectionHeader(String title, String action, {Color? actionColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: _t(16, FontWeight.w800, _text)),
        Text(
          action,
          style: _t(
            12,
            FontWeight.w600,
            actionColor ?? const Color(0xFF0B8FD4),
          ),
        ),
      ],
    );
  }

  // ── Financial highlights: horizontal scroll, equal width cards ─
  Widget _highlights() {
    return SizedBox(
      height: 168,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [_usdCard(), const SizedBox(width: 14), _spendingCard()],
      ),
    );
  }

  Widget _usdCard() {
    return Container(
      width: _highlightW,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _navy,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.14),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  'USD',
                  style: _t(10, FontWeight.w700, Colors.white),
                ),
              ),
              const Icon(
                Icons.visibility_outlined,
                size: 18,
                color: Colors.white60,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            '1USD EUR 0.95 GBR 0.79',
            style: _t(10, FontWeight.w500, Colors.white60),
          ),
          const SizedBox(height: 4),
          Text(
            '\$26,887.09',
            style: _t(26, FontWeight.w800, Colors.white, spacing: -.5),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '+\$421.03',
                style: _t(11, FontWeight.w700, const Color(0xFF4ADE80)),
              ),
              const SizedBox(width: 4),
              Text('today', style: _t(11, FontWeight.w500, Colors.white60)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _spendingCard() {
    return Container(
      width: _highlightW, // same width as the dark card
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F7C6),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Spending', style: _t(12, FontWeight.w600, _greenDark)),
          const SizedBox(height: 6),
          Text(
            '\$8,546.13',
            style: _t(24, FontWeight.w800, _text, spacing: -.5),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.arrow_drop_up,
                size: 18,
                color: Color(0xFF2E9E5B),
              ),
              Text(
                '10.05%',
                style: _t(11, FontWeight.w700, const Color(0xFF2E9E5B)),
              ),
              const SizedBox(width: 6),
              Text('From last week', style: _t(10, FontWeight.w500, _muted)),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: CustomPaint(painter: _LinePainter()),
          ),
        ],
      ),
    );
  }

  // ── Transaction row ──────────────────────────────────────────
  Widget _txn({
    IconData? icon,
    String? label,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String sub,
    required String amount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: icon != null
                ? Icon(icon, size: 20, color: iconColor)
                : Text(label!, style: _t(9, FontWeight.w800, iconColor)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: _t(14, FontWeight.w700, _text)),
                const SizedBox(height: 2),
                Text(sub, style: _t(11, FontWeight.w500, _muted)),
              ],
            ),
          ),
          Text(amount, style: _t(14, FontWeight.w800, _text)),
        ],
      ),
    );
  }

  // ── Floating bottom bar ──────────────────────────────────────
  Widget _bottomBar() {
    Widget item(int i, IconData icon) {
      final active = _nav == i;
      return GestureDetector(
        onTap: () => setState(() => _nav = i),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: active ? _blue.withOpacity(.15) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 22, color: active ? _blue : _muted),
        ),
      );
    }

    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          item(0, Icons.home_rounded),
          item(1, Icons.bar_chart_rounded),
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: _navy,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 26),
          ),
          item(2, Icons.credit_card_outlined),
          item(3, Icons.person_outline),
        ],
      ),
    );
  }
}

/// Simple green line chart for the "My Spending" card.
class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const pts = [0.55, 0.7, 0.5, 0.65, 0.4, 0.55, 0.3, 0.45, 0.2];
    final paint = Paint()
      ..color = const Color(0xFF6CB82E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    for (var i = 0; i < pts.length; i++) {
      final x = size.width * i / (pts.length - 1);
      final y = size.height * pts[i];
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
