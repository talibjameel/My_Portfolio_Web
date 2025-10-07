import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';


class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Outer page background similar to your screenshot
    return Scaffold(
      backgroundColor: const Color(0xFF2B2E2F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  // Title or spacing (optional)
                  SizedBox(height: 8),
                  ExperienceTimeline(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Strongly-typed model to avoid casting errors.
class Experience {
  final String company;
  final String role;
  final String duration;
  final List<String> technologies;
  final List<String> responsibilities;

  const Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.technologies,
    required this.responsibilities,
  });
}
class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  // Sample data (dynamic / add more entries as needed)
  static const _experiences = <Experience>[
    Experience(
      company: 'Vordx Technologies',
      role: 'Senior Flutter Engineer',
      duration: '2023 - Present',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'Provider',
        'Hive',
        'Secure Storage',
        'CI/CD',
        'GitHub',
        'MVVM Architecture',
        'Google ML Kit',
      ],
      responsibilities: [
        'Led the development of multiple large-scale Flutter applications with robust backend integration using RESTful APIs.',
        'Implemented advanced state management using Provider, ensuring smooth data flow and optimized UI rendering.',
        'Built dynamic and reusable UI components including bottom sheets, tabbed views, scrollable sheets, and timeline widgets with pixel-perfect responsiveness.',
        'Developed a complete journal insights system using Hive caching, API synchronization, and duration-based data visualization (week, month, quarter, six-month).',
        'Integrated secure user authentication and token management using Flutter Secure Storage.',
        'Engineered notification systems with real-time updates, API-driven data sync, and provider-based state tracking.',
        'Worked on caching mechanisms for media content (podcasts, articles, videos) with background synchronization and data comparison logic.',
        'Optimized app performance and reduced build size by refactoring providers and implementing cache-first architecture.',
        'Integrated OCR functionality using Google ML Kit for text extraction and implemented overlay features using floating widgets.',
        'Collaborated closely with design and backend teams to maintain clean architecture, scalability, and consistent UX across all Flutter platforms.',
        'Maintained CI/CD workflows, performed detailed code reviews, and ensured adherence to best practices in Flutter development.',
      ],
    ),
    Experience(
      company: 'Infinkey Solutions',
      role: 'Flutter Developer',
      duration: '2022 - 2023',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'Git',
      ],
      responsibilities: [
        'Developed and maintained cross-platform mobile applications using Flutter and Dart.',
        'Worked on UI implementation following Figma designs and Material Design guidelines.',
        'Integrated Firebase Authentication and basic CRUD operations using Cloud Firestore.',
        'Collaborated with senior developers to learn and apply clean architecture principles.',
        'Assisted in debugging, testing, and optimizing app performance for Android and iOS platforms.',
        'Gained hands-on experience with RESTful API integration and version control using Git.',
      ],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _experiences
          .map((exp) => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: ExperienceCard(experience: exp),
      ))
          .toList(),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  const ExperienceCard({super.key, required this.experience});

  static const Color cardColor = AppColors.background2;
  static const Color accentGreen = AppColors.green;
  static const double maxCardRadius = 12;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTwoColumn = constraints.maxWidth >= 900;

      return Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(maxCardRadius),
        ),
        padding: const EdgeInsets.all(24),
        child: isTwoColumn ? _buildTwoColumn() : _buildStacked(),
      );
    });
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.company,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: accentGreen,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          experience.role,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          experience.duration,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildTechnologiesColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: experience.technologies
              .map((t) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  t,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildResponsibilitiesColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: experience.responsibilities
          .map((r) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                r,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ))
          .toList(),
    );
  }

  Widget _buildTwoColumn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildTechnologiesColumn(),
            ],
          ),
        ),

        const SizedBox(width: 40),

        Flexible(
          flex: 7,
          child: _buildResponsibilitiesColumn(),
        ),
      ],
    );
  }

  Widget _buildStacked() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 18),
        _buildTechnologiesColumn(),
        const SizedBox(height: 18),
        _buildResponsibilitiesColumn(),
      ],
    );
  }
}
