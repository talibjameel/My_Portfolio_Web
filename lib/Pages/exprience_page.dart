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
      duration: 'Jul 2023 - Present',
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
        'Engineered and shipped production-grade Flutter applications for Android and iOS, currently live on the Google Play Store with strong user engagement and ratings.',
        'Architected scalable mobile applications using Clean Architecture and Provider state management, improving maintainability and reducing regression issues across Agile sprint cycles.',
        'Integrated RESTful APIs and Firebase services including Firestore, Authentication, FCM, and Cloud Storage to deliver secure and real-time user experiences.',
        'Implemented offline-first architecture using Hive local storage, significantly improving app reliability during unstable network conditions.',
        'Developed reusable UI systems and responsive layouts across multiple screen sizes, ensuring consistent and pixel-perfect user experiences.',
        'Integrated Google ML Kit OCR functionality and custom overlay workflows for intelligent scanning and text extraction features.',
        'Optimized application performance through efficient state management, lazy loading, caching strategies, and code refactoring.',
        'Led and mentored Flutter developers while conducting code reviews and maintaining high-quality engineering standards.',
        'Collaborated with product, backend, and design teams to deliver scalable, business-focused digital products.',
        'Established CI/CD workflows and streamlined release processes for faster and more reliable deployments.',
      ],
    ),

    Experience(
      company: 'Unique Web Designer',
      role: 'Full Stack Developer',
      duration: 'Jan 2026 - Mar 2026',
      technologies: [
        'React.js',
        'Node.js',
        'Express.js',
        'MongoDB',
        'JavaScript',
        'Chrome Extension API',
        'WebRTC',
        'Socket.io',
        'QuickBooks API',
        'REST APIs',
        'Git',
        'Responsive Design',
      ],
      responsibilities: [
        'Delivered multiple client-based full-stack applications and Chrome extension solutions within a fast-paced contract timeline.',
        'Developed Invoice App, a web-based accounting and QuickBooks management platform for handling invoices, transactions, and financial workflows.',
        'Built Double Take, an eCommerce product extraction platform with Chrome extension support for collecting, organizing, and sharing products.',
        'Implemented real-time communication features using WebRTC and Socket.io to enable seamless in-app user interactions.',
        'Integrated QuickBooks APIs for automated accounting workflows and improved business record management.',
        'Designed responsive and modern web interfaces optimized for performance, usability, and cross-browser compatibility.',
        'Managed complete full-stack development including frontend architecture, backend APIs, database management, and deployment workflows.',
        'Collaborated with teams and stakeholders to deliver scalable and production-ready web solutions on schedule.',
      ],
    ),

    Experience(
      company: 'E-House Movers',
      role: 'Flutter Developer (Android & iOS)',
      duration: 'Nov 2025 - Dec 2025',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase Authentication',
        'Google Sign-In',
        'REST APIs',
        'Riverpod',
        'Clean Architecture',
        'Hive',
        'Flutter Secure Storage',
        'Responsive UI',
        'Cross-Platform Development',
      ],
      responsibilities: [
        'Designed and developed a cross-platform moving and storage service application for Dubai-based clients across Android and iOS.',
        'Implemented scalable application architecture using Riverpod and Clean Architecture to ensure maintainability and future scalability.',
        'Integrated Firebase Authentication, Firestore, and REST APIs for dynamic booking, storage management, and real-time workflows.',
        'Built responsive and reusable UI systems delivering consistent user experiences across Android and iOS devices.',
        'Implemented offline-first functionality and optimized application performance for smooth and reliable operation.',
        'Collaborated closely with backend and design teams to deliver all core modules within a tight project deadline.',
      ],
    ),

    Experience(
      company: 'Infinkey Solutions',
      role: 'Flutter Developer Intern',
      duration: 'Aug 2022 - Dec 2022',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'Git',
      ],
      responsibilities: [
        'Contributed to cross-platform Flutter application development with responsive UI implementation and reusable components.',
        'Integrated Firebase Authentication and Firestore CRUD operations for real-time mobile application features.',
        'Worked closely with senior developers to adopt clean architecture principles and scalable coding practices.',
        'Participated in debugging, testing, and performance optimization to improve application stability and usability.',
        'Collaborated within Git-based development workflows while gaining hands-on experience in Agile environments.',
        'Built strong foundational expertise in Flutter development, REST API integration, and modern mobile engineering practices.',
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
