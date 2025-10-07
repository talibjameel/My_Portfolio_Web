import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utility Funcation/social_icons.dart';
import '../app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background2,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Headline
          Text(
            'Let’s build something great together',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 40),

          // Email Card
          _ContactInfoCard(
            icon: Icons.email_outlined,
            title: "Email",
            value: "Developer82542@gmail.com",
            onTap: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'Developer82542@gmail.com',
                query: Uri.encodeFull('subject=Hello Talib&body=Hi, I’d like to discuss a project.'),
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
          ),

          const SizedBox(height: 20),

          // Phone Card
          _ContactInfoCard(
            icon: Icons.phone_android,
            title: "Phone / WhatsApp",
            value: "+92 309 4008114",
            onTap: () async {
              final Uri whatsappUri = Uri.parse(
                  'https://wa.me/923094008114?text=Hello%20Talib,%20I’d%20like%20to%20connect%20regarding%20a%20project.');
              if (await canLaunchUrl(whatsappUri)) {
                await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
              }
            },
          ),

          const SizedBox(height: 40),

          // Social Icons
          Row(
            children: [
              Spacer(),
              SocialIconsRow(),
              Spacer(),
            ],
          ) ,
          const SizedBox(height: 40),
        ],
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
  static const Color primaryGreen = AppColors.green;

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
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              width: cardWidth,
              decoration: BoxDecoration(
                color: AppColors.background1,
                borderRadius: BorderRadius.circular(16),
                boxShadow: hover
                    ? [
                  BoxShadow(
                    blurRadius: 18,
                    spreadRadius: 4,
                    color: primaryGreen.withValues(alpha: .6),
                    offset: const Offset(0, 6),
                  ),
                ]
                    : [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 1,
                    color: Colors.black.withValues(alpha: 0.4),
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: primaryGreen, size: 36),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.value,
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
