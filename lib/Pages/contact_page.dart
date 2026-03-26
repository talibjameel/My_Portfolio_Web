import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utility Funcation/social_icons.dart';
import '../app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background2,
            AppColors.background1,
            AppColors.background2,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background decorative elements
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: RadialGradient(
                  center: const Alignment(0.3, -0.2),
                  radius: 1.8,
                  colors: [
                    AppColors.green.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(
              children: [
                // Professional Header
                _buildProfessionalHeader(),
                const SizedBox(height: 80),

                // Contact Grid
                _buildProfessionalContactGrid(),
                const SizedBox(height: 80),

                // Enhanced Social Section
                _buildProfessionalSocialSection(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalHeader() {
    return Column(
      children: [
        // Professional badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.green.withValues(alpha: 0.2),
                AppColors.green.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppColors.green.withValues(alpha: 0.4),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'CONTACT ME',
                style: GoogleFonts.inter(
                  color: AppColors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),

        // Professional headline
        Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ready to bring your ideas to ',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.w300,
                    height: 1.2,
                    letterSpacing: -1,
                  ),
                ),
                TextSpan(
                  text: 'life?',
                  style: GoogleFonts.poppins(
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          AppColors.green,
                          AppColors.green.withValues(alpha: 0.8),
                        ],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                    fontSize: 56,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Subtitle
        Text(
          'Let\'s collaborate and create something extraordinary together',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),

        // Decorative line
        Center(
          child: Container(
            width: 200,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.green.withValues(alpha: 0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfessionalContactGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;

        if (isDesktop) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfessionalContactCard(
                icon: Icons.email_rounded,
                title: "Email",
                subtitle: "Developer82542@gmail.com",
                description: "Send me a message anytime",
                onTap: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'Developer82542@gmail.com',
                    query: Uri.encodeFull(
                      'subject=Hello Talib&body=Hi, I\'d like to discuss a project.',
                    ),
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  }
                },
                delay: 0,
              ),
              const SizedBox(width: 40),
              _ProfessionalContactCard(
                icon: Icons.phone_android,
                title: "WhatsApp",
                subtitle: "+92 309 4008114",
                description: "Available for quick chats",
                onTap: () async {
                  final Uri whatsappUri = Uri.parse(
                    'https://wa.me/923094008114?text=Hello%20Talib,%20I\'d%20like%20to%20connect%20regarding%20a%20project.',
                  );
                  if (await canLaunchUrl(whatsappUri)) {
                    await launchUrl(
                      whatsappUri,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                delay: 200,
              ),
            ],
          );
        } else {
          return Column(
            children: [
              _ProfessionalContactCard(
                icon: Icons.email_rounded,
                title: "Email",
                subtitle: "Developer82542@gmail.com",
                description: "Send me a message anytime",
                onTap: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'Developer82542@gmail.com',
                    query: Uri.encodeFull(
                      'subject=Hello Talib&body=Hi, I\'d like to discuss a project.',
                    ),
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  }
                },
                delay: 0,
              ),
              const SizedBox(height: 32),
              _ProfessionalContactCard(
                icon: Icons.phone_android,
                title: "WhatsApp",
                subtitle: "+92 309 4008114",
                description: "Available for quick chats",
                onTap: () async {
                  final Uri whatsappUri = Uri.parse(
                    'https://wa.me/923094008114?text=Hello%20Talib,%20I\'d%20like%20to%20connect%20regarding%20a%20project.',
                  );
                  if (await canLaunchUrl(whatsappUri)) {
                    await launchUrl(
                      whatsappUri,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                delay: 200,
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildProfessionalSocialSection() {
    return Column(
      children: [
        // Section title
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            'CONNECT ON SOCIAL MEDIA',
            style: GoogleFonts.inter(
              color: Colors.white60,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Social container with glassmorphism
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              colors: [
                AppColors.green.withValues(alpha: 0.3),
                AppColors.green.withValues(alpha: 0.1),
                AppColors.green.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.background1,
              borderRadius: BorderRadius.circular(77),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(77),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: const SocialIconsRow(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfessionalContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onTap;
  final int delay;

  const _ProfessionalContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.onTap,
    required this.delay,
  });

  @override
  State<_ProfessionalContactCard> createState() =>
      _ProfessionalContactCardState();
}

class _ProfessionalContactCardState extends State<_ProfessionalContactCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeInAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              constraints: const BoxConstraints(minWidth: 320, maxWidth: 400),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    colors: _isHovered
                        ? [
                            AppColors.green.withValues(alpha: 0.6),
                            AppColors.green.withValues(alpha: 0.2),
                          ]
                        : [
                            Colors.white.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.background1,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon with animation
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: _isHovered
                                ? [
                                    AppColors.green.withValues(alpha: 0.4),
                                    AppColors.green.withValues(alpha: 0.2),
                                  ]
                                : [
                                    AppColors.green.withValues(alpha: 0.25),
                                    AppColors.green.withValues(alpha: 0.15),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: _isHovered
                              ? [
                                  BoxShadow(
                                    color: AppColors.green.withValues(
                                      alpha: 0.5,
                                    ),
                                    blurRadius: 25,
                                    offset: const Offset(0, 10),
                                  ),
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                        ),
                        child: Icon(
                          widget.icon,
                          color: AppColors.green,
                          size: 36,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title
                      Text(
                        widget.title,
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtitle
                      Text(
                        widget.subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Text(
                        widget.description,
                        style: GoogleFonts.poppins(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Arrow indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? AppColors.green.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: AnimatedRotation(
                          turns: _isHovered ? 0.25 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Icon(
                            Icons.arrow_forward,
                            color: _isHovered
                                ? AppColors.green
                                : AppColors.green.withValues(alpha: 0.6),
                            size: 24,
                          ),
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
}

class _ContactInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<_ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<_ContactInfoCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double cardWidth = constraints.maxWidth > 600
                ? 450
                : constraints.maxWidth * 0.9; // responsive width

            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              width: cardWidth,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: hover
                        ? [
                            AppColors.green.withValues(alpha: 0.4),
                            AppColors.green.withValues(alpha: 0.1),
                          ]
                        : [
                            Colors.white.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background1,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Animated Icon Container
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: hover
                                ? [
                                    AppColors.green.withValues(alpha: 0.3),
                                    AppColors.green.withValues(alpha: 0.15),
                                  ]
                                : [
                                    AppColors.green.withValues(alpha: 0.2),
                                    AppColors.green.withValues(alpha: 0.1),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: hover
                              ? [
                                  BoxShadow(
                                    color: AppColors.green.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ]
                              : [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                        ),
                        child: Icon(
                          widget.icon,
                          color: AppColors.green,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Text Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.value,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Animated Arrow
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: hover
                              ? AppColors.green.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AnimatedRotation(
                          turns: hover ? 0.25 : 0,
                          duration: const Duration(milliseconds: 400),
                          child: Icon(
                            Icons.arrow_forward,
                            color: hover
                                ? AppColors.green
                                : AppColors.green.withValues(alpha: 0.6),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
