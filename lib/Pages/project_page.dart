import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Badr',
        'image': 'res/quran.png',
        'description': 'A Quran reading Flutter app with notes and bookmarks.',
      },
      {
        'title': 'ScanText-Ai',
        'image': 'res/quran.png',
        'description': 'Text scanning app powered by AI OCR for quick extraction.',
      },
      {
        'title': 'Kanz',
        'image': 'res/quran.png',
        'description': 'Loan management app with easy user tracking and approval.',
      },
      {
        'title': 'Igloo',
        'image': 'res/quran.png',
        'description': 'Real estate app with listings and property details.',
      },
      {
        'title': 'Naqdi',
        'image': 'res/quran.png',
        'description': 'Digital wallet app with payments and balance tracking.',
      },
      {
        'title': 'Enfin_Libra',
        'image': 'res/quran.png',
        'description': 'Library app for managing ebooks and reading progress.',
      },
      {
        'title': 'GemStore',
        'image': 'res/quran.png',
        'description': 'E-commerce store app for jewelry and accessories.',
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
            childAspectRatio: 1.17,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final p = projects[index];
            return _ProjectCard(
              title: p['title']!,
              image: p['image']!,
              description: p['description']!,
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
  final String description;

  const _ProjectCard({
    required this.title,
    required this.image,
    required this.description,
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
          borderRadius: BorderRadius.circular(16),
          boxShadow: hover
              ? [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 4,
              color: primaryGreen.withValues(alpha: 0.6),
              offset: const Offset(0, 6),
            ),
          ]
              : [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 1,
              color: Colors.black.withValues(alpha: 0.4),
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project Image (tall and responsive)
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Project Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 6),

            // Project Description (dynamic)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
