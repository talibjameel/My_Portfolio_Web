import 'package:flutter/material.dart';
import 'package:portfolio_web/Widgets/header_widgets.dart';
import '../app_colors.dart';
import 'landing_page.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _listController;
  late Animation<double> _headerFade;
  late Animation<Offset> _headerSlide;

  final List<ServiceItem> services = [
    ServiceItem(
      title: 'Mobile Development',
      description:
          'Building pixel-perfect, high-performance apps for iOS & Android from a single codebase.',
      icon: Icons.phone_iphone_rounded,
      tag: 'iOS & Android',
      gradientColors: [Color(0xFF00B8D9), Color(0xFF0097B2)],
    ),
    ServiceItem(
      title: 'Web Development',
      description:
          'Crafting blazing-fast, responsive web experiences with cutting-edge technology stacks.',
      icon: Icons.language_rounded,
      tag: 'Full Stack',
      gradientColors: [Color(0xFF00C896), Color(0xFF00A878)],
    ),

    ServiceItem(
      title: 'AI Integration',
      description:
          'Embedding intelligent features — from smart search to predictive analytics — into your products.',
      icon: Icons.psychology_rounded,
      tag: 'Machine Learning',
      gradientColors: [Color(0xFFFFB347), Color(0xFFFF8C00)],
    ),
    ServiceItem(
      title: 'WordPress Web Development',
      description:
          'Engineering robust, secure REST & GraphQL APIs built for scale and developer experience.',
      icon: Icons.hub_rounded,
      tag: 'Backend',
      gradientColors: [Color(0xFF00C896), Color(0xFF00A878)],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _listController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _headerFade = CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeOut,
    );
    _headerSlide = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _headerController,
            curve: Curves.easeOutCubic,
          ),
        );

    _headerController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _listController.forward();
    });
  }

  @override
  void dispose() {
    _headerController.dispose();
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= PortfolioPage.desktopBreakpoint;
    final isTablet =
        width >= PortfolioPage.tabletBreakpoint &&
        width < PortfolioPage.desktopBreakpoint;

    return Scaffold(
      backgroundColor: AppColors.background1,
      endDrawer: const PortfolioDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Same Header as Landing Page ───────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 38 : (isTablet ? 20 : 6),
                vertical: isDesktop ? 18 : (isTablet ? 12 : 6),
              ),
              child: Row(
                children: [
                  const Expanded(child: Logo()),
                  if (isDesktop) const TopNav() else const MobileView(),
                ],
              ),
            ),
          ),

          // ── Premium SliverAppBar ──────────────────────────────────
          // ── Header Container ──────────────────────────────────────────────
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _headerFade,
              child: SlideTransition(
                position: _headerSlide,
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.background1,
                        AppColors.background2,
                        AppColors.background1,
                      ],
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Decorative glowing orbs
                      Positioned(
                        top: -40,
                        right: -40,
                        child: _GlowOrb(
                          size: 200,
                          color: AppColors.green.withValues(alpha: 0.15),
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        left: -20,
                        child: _GlowOrb(
                          size: 150,
                          color: AppColors.green.withValues(alpha: 0.08),
                        ),
                      ),

                      // Grid lines decoration
                      CustomPaint(
                        painter: _GridPainter(
                          color: Colors.white.withValues(alpha: 0.03),
                        ),
                      ),

                      // Header content
                      Positioned(
                        bottom: 30,
                        left: 24,
                        right: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.green.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.green.withValues(alpha: 0.4),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: AppColors.green,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.green.withValues(
                                            alpha: 0.8,
                                          ),
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    'WHAT WE OFFER',
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Title
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Our ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w300,
                                      height: 1.1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Services',
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'We blend architectural precision with digital innovation to build products that define the next generation of the web & app.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.3,
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
          ),
          // ── Stats Row ─────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: _StatsRow(),
            ),
          ),

          // ── Service Cards ─────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return AnimatedBuilder(
                  animation: _listController,
                  builder: (context, child) {
                    final delay = index * 0.12;
                    final start = delay;
                    final end = (delay + 0.5).clamp(0.0, 1.0);
                    final progress = Curves.easeOutCubic.transform(
                      ((_listController.value - start) / (end - start)).clamp(
                        0.0,
                        1.0,
                      ),
                    );
                    return Opacity(
                      opacity: progress,
                      child: Transform.translate(
                        offset: Offset(0, 30 * (1 - progress)),
                        child: child,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: _PremiumServiceCard(service: services[index]),
                  ),
                );
              }, childCount: services.length),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Premium Service Card ───────────────────────────────────────────────────────

class _PremiumServiceCard extends StatefulWidget {
  final ServiceItem service;
  const _PremiumServiceCard({required this.service});

  @override
  State<_PremiumServiceCard> createState() => _PremiumServiceCardState();
}

class _PremiumServiceCardState extends State<_PremiumServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _scaleAnim;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _pressController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.service;
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _pressController.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _pressController.reverse();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _pressController.reverse();
      },
      onTap: () {
        // Redirect to contact page
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        Future.delayed(const Duration(milliseconds: 300), () {
          PortfolioPage.scrollToSection(PortfolioPage.contactKey);
        });
      },
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background2,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isPressed
                  ? AppColors.green.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.07),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
              if (_isPressed)
                BoxShadow(
                  color: AppColors.green.withValues(alpha: 0.1),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Subtle background accent
                Positioned(
                  right: -30,
                  top: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          s.gradientColors[0].withValues(alpha: 0.08),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon container
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: s.gradientColors,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: s.gradientColors[0].withValues(alpha: 0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Icon(s.icon, color: Colors.white, size: 26),
                      ),

                      const SizedBox(width: 16),

                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Tag pill
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: s.gradientColors[0].withValues(
                                  alpha: 0.12,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                s.tag,
                                style: TextStyle(
                                  color: s.gradientColors[0],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Title
                            Text(
                              s.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                                letterSpacing: -0.3,
                              ),
                            ),

                            const SizedBox(height: 6),

                            // Description
                            Text(
                              s.description,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.55),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),

                            const SizedBox(height: 14),

                            // Footer row
                            Row(
                              children: [
                                // Learn more
                                Text(
                                  'Learn more',
                                  style: TextStyle(
                                    color: s.gradientColors[0],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: s.gradientColors[0],
                                  size: 14,
                                ),
                                const Spacer(),
                                // Bookmark icon
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.06),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white.withValues(alpha: 0.4),
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}

// ── Stats Row Widget ───────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.background2,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          _StatItem(value: '4+', label: 'Services'),
          _Divider(),
          _StatItem(value: '10+', label: 'Projects'),
          _Divider(),
          _StatItem(value: '99%', label: 'Satisfaction'),
          _Divider(),
          _StatItem(value: '5 ★', label: 'Rating'),
        ],
      ),
    );
  }
}

class _StatItem extends StatefulWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  State<_StatItem> createState() => _StatItemState();
}

class _StatItemState extends State<_StatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Parses "4+", "10+", "99%", "5 ★" → returns the numeric part and suffix
  ({double number, String suffix}) get _parsed {
    final raw = widget.value.trim();
    final match = RegExp(r'^([\d.]+)(.*)$').firstMatch(raw);
    if (match == null) return (number: 0, suffix: raw);
    return (
      number: double.tryParse(match.group(1)!) ?? 0,
      suffix: match.group(2)!.trim(),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(
      begin: 0,
      end: _parsed.number,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final parsed = _parsed;
    return Expanded(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              // Show integer if the target is a whole number
              final isWhole = parsed.number == parsed.number.roundToDouble();
              final display = isWhole
                  ? _animation.value.round().toString()
                  : _animation.value.toStringAsFixed(1);
              return Text(
                '$display ${parsed.suffix}'.trim(),
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              );
            },
          ),
          const SizedBox(height: 2),
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.45),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 32,
      color: Colors.white.withValues(alpha: 0.08),
    );
  }
}

// ── Glow Orb ──────────────────────────────────────────────────────────────────

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  const _GlowOrb({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, Colors.transparent]),
      ),
    );
  }
}

// ── Grid Painter ──────────────────────────────────────────────────────────────

class _GridPainter extends CustomPainter {
  final Color color;
  _GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) => false;
}

// ── Data Model ────────────────────────────────────────────────────────────────

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;
  final String tag;
  final List<Color> gradientColors;

  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.tag,
    required this.gradientColors,
  });
}
