import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Igloo',
        'desc': 'Social Media App',
        'link': 'https://github.com/',
      },
      {
        'title': 'Enfin_Libra',
        'desc': 'Fitness / Activity Tracking',
        'link': 'https://github.com/',
      },
      {
        'title': 'Kanz',
        'desc': 'E-Commerce App',
        'link': 'https://github.com/',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isRow = width > 800;
        return isRow
            ? Row(
          children: projects
              .map(
                (p) => Expanded(
              child: _ProjectCard(
                title: p['title']!,
                desc: p['desc']!,
                link: p['link']!,
              ),
            ),
          )
              .toList(),
        )
            : Column(
          children: projects
              .map(
                (p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ProjectCard(
                title: p['title']!,
                desc: p['desc']!,
                link: p['link']!,
              ),
            ),
          )
              .toList(),
        );
      },
    );
  }
}
class _ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  final String link;
  const _ProjectCard({
    required this.title,
    required this.desc,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color(0xFF0B1324),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: const TextStyle(height: 1.4, color: Colors.white70),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(link))) {
                  launchUrl(Uri.parse(link));
                }
              },
              child: const Text('See More'),
            ),
          ],
        ),
      ),
    );
  }
}
