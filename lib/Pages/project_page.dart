import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_colors.dart';

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Badr',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/Badr',
      },
      {
        'title': 'ScanText-Ai',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/ScanText-Ai',
      },
      {
        'title': 'Kanz',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/Kanz_loan_application',
      },
      {
        'title': 'Igloo',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/igloo-app',
      },
      {
        'title': 'Naqdi',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/Naqdi',
      },
      {
        'title': 'Enfin_Libra',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/Enfin_Libra',
      },
      {
        'title': 'GemStore',
        'image': 'res/quran.png',
        'link': 'https://github.com/talibjameel/GemStore',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;

        if (constraints.maxWidth >= 1000) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final p = projects[index];
            return _ProjectCard(
              title: p['title']!,
              image: p['image']!,
              link: p['link']!,
            );
          },
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String image;
  final String link;

  const _ProjectCard({
    required this.title,
    required this.image,
    required this.link,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}
class _ProjectCardState extends State<_ProjectCard> {
  bool hover = false;

  static const Color primaryGreen = AppColors.green;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.background1,
          borderRadius: BorderRadius.circular(12),
          boxShadow: hover
              ? [
            BoxShadow(
              blurRadius: 18,
              spreadRadius: 4,
              color: primaryGreen.withValues(alpha: 0.6),
              offset: const Offset(0, 4),
            ),
          ]
              : [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 1,
              color: Colors.black.withValues(alpha: 0.4),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                widget.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),

            // Project Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // "See More" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,),
              child: MaterialButton(
                onPressed: () async {
                  final uri = Uri.parse(widget.link);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    debugPrint("Could not launch ${widget.link}");
                  }
                },
                color: AppColors.background2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'icons/github.svg',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text('GitHub'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
