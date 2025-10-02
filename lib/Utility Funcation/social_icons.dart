import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_colors.dart';

class SocialIconsRow extends StatefulWidget {
  const SocialIconsRow({super.key});

  @override
  State<SocialIconsRow> createState() => _SocialIconsRowState();
}

class _SocialIconsRowState extends State<SocialIconsRow> {
  final Color iconColor = AppColors.green;

  final Map<IconData, String> links = {
    FontAwesomeIcons.linkedinIn: "https://www.linkedin.com/in/talib-jameel-3622a6226/",
    FontAwesomeIcons.github: "https://github.com/talibjameel",
    FontAwesomeIcons.instagram: "https://instagram.com/",
    FontAwesomeIcons.stackOverflow: "https://stackoverflow.com/users/27923786/talib-developer",
  };

  final Map<IconData, bool> _hovering = {};

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Responsive scaling
    final bool isTablet = width >= 600 && width < 1024;
    final bool isDesktop = width >= 1024;

    final double iconSize = isDesktop
        ? 24
        : isTablet
        ? 22
        : 20; // smaller on mobile

    final double containerSize = isDesktop
        ? 40
        : isTablet
        ? 36
        : 32; // scales with device

    final double spacing = isDesktop
        ? 12
        : isTablet
        ? 10
        : 8;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: links.entries.map((entry) {
        final icon = entry.key;
        final url = entry.value;
        final isHovering = _hovering[icon] ?? false;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: MouseRegion(
            onEnter: (_) => setState(() => _hovering[icon] = true),
            onExit: (_) => setState(() => _hovering[icon] = false),
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: containerSize,
                height: containerSize,
                decoration: BoxDecoration(
                  color: const Color(0XFF25262A),
                  borderRadius: BorderRadius.circular(containerSize / 2),
                  boxShadow: isHovering
                      ? [
                    BoxShadow(
                      blurRadius: 16,
                      color: iconColor.withValues(alpha: 0.6),
                      offset: const Offset(0, 0),
                    ),
                  ]
                      : [
                    const BoxShadow(
                      blurRadius: 12,
                      color: Colors.black12,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Icon(icon, color: iconColor, size: iconSize),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}