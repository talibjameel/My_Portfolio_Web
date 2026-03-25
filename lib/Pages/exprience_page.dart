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
        'Clean Architecture',
        'MVVM',
        'Google ML Kit',
      ],
      responsibilities: [
        'Led end-to-end development of multiple production-grade Flutter applications, managing the full lifecycle from architecture design to deployment.',
        'Managed and mentored a team of Flutter developers, driving code quality, best practices, and consistent delivery across multiple projects.',
        'Designed scalable and maintainable systems using Clean Architecture and MVVM, improving code reusability and long-term maintainability.',
        'Architected efficient state management solutions using Provider, reducing unnecessary rebuilds and enhancing app performance.',
        'Built highly reusable and modular UI systems, accelerating development speed and ensuring consistent design across apps.',
        'Implemented secure authentication flows and token handling using Flutter Secure Storage and Firebase services.',
        'Developed advanced data handling strategies including caching, offline-first architecture, and API synchronization using Hive.',
        'Engineered real-time features such as notifications and dynamic content updates with optimized state handling.',
        'Integrated OCR capabilities using Google ML Kit and developed custom overlay-based UI interactions.',
        'Improved app performance and reduced build size through code refactoring, lazy loading, and efficient resource management.',
        'Collaborated cross-functionally with product, design, and backend teams to deliver scalable, user-centric solutions.',
        'Established and maintained CI/CD pipelines, streamlined release processes, and conducted thorough code reviews to ensure high-quality standards.',
      ],
    ),
    Experience(
      company: 'E-House Mover (Dubai, UAE)',
      role: 'Flutter Developer (Android & iOS)',
      duration: 'Oct - Dec 25 (Project base)',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase Authentication',
        'Google Sign-In',
        'REST APIs',
        'Clean Architecture',
        'Provider',
        'Hive',
        'Flutter Secure Storage',
        'Responsive UI',
        'Cross-Platform Development',
      ],
      responsibilities: [
        'Developed and maintained a cross-platform mobile application to streamline the house moving experience across Android and iOS.',
        'Implemented secure authentication using Firebase Google Sign-In and managed sensitive data with Flutter Secure Storage.',
        'Designed and built a scalable codebase using Clean Architecture principles, ensuring separation of concerns and maintainability.',
        'Integrated RESTful APIs for managing moving requests, tracking progress, and synchronizing user data in real time.',
        'Developed responsive and reusable UI components for dashboards, profile management, and moving workflows.',
        'Implemented local data persistence using Hive to support offline access and improve app performance.',
        'Optimized application performance through efficient state management and reduced unnecessary rebuilds.',
        'Collaborated with backend and design teams to deliver a consistent and user-friendly experience across platforms.',
        'Ensured cross-platform compatibility including Android, iOS, Web, and Desktop environments.',
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
