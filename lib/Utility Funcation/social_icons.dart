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
    FontAwesomeIcons.linkedinIn: "https://www.linkedin.com/",
    FontAwesomeIcons.github: "https://github.com/",
    FontAwesomeIcons.instagram: "https://instagram.com/",
    FontAwesomeIcons.twitter: "https://twitter.com/",
    FontAwesomeIcons.medium: "https://medium.com/",
    FontAwesomeIcons.stackOverflow: "https://stackoverflow.com/",
  };

  final Map<IconData, bool> _hovering = {};

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: links.entries.map((entry) {
        final icon = entry.key;
        final url = entry.value;
        final isHovering = _hovering[icon] ?? false;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0XFF25262A),
                  borderRadius: BorderRadius.circular(25),
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
                child: Icon(icon, color: iconColor, size: 24),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

