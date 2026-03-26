import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Badr Islamic Activity tracker App',
        'image': 'res/badr.jpeg',
        'description': 'A Quran reading Flutter app with notes and bookmarks.',
      },
      {
        'title': 'Habyn Activity Tracker',
        'image': 'res/habyn.jpeg',
        'description': 'Habyn Activity Tracker and communication app',
      },
      {
        'title': 'TailorX',
        'image': 'res/TailorX.jpg',
        'description': 'TailorX Premium tool for fashion brands and tailors',
      },
      {
        'title': 'ScanText-Ai',
        'image': 'res/scan_text_ai.jpg',
        'description':
            'Text scanning app powered by AI OCR for quick extraction.',
      },
      {
        'title': 'GYM Star',
        'image': 'res/gymApp.jpg',
        'description':
            'GYM Star app for managing fitness routines and workouts',
      },
      {
        'title': 'Kanz Loan App',
        'image': 'res/kanz_loan_app.jpeg',
        'description':
            'Loan management app with easy user tracking and approval.',
      },
      {
        'title': 'Igloo Social Media App',
        'image': 'res/Igloo.jpeg',
        'description':
            'Social media helping  app for sharing thought, photos and videos.',
      },
      {
        'title': 'GemStore Ecommerce App',
        'image': 'res/gem_store.jpeg',
        'description': 'E-commerce store app for jewelry and accessories.',
      },
      {
        'title': 'E-House Movers',
        'image': 'res/E-house-Mover-app.jpeg',
        'description':
            'Premium logistics platform with intuitive booking, real-time tracking, and scalable architecture.',
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
            mainAxisExtent: crossAxisCount == 1 ? 320 : 260,
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
          children: [
            // Project Image (tall and responsive)
            Flexible(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),

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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),

            // Project Description (dynamic)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  widget.description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    height: 1.3,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
