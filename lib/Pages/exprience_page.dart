import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        'role': 'Flutter Engineer',
        'company': 'Vordx Technologies',
        'duration': '2023 – Present',
      },
      {
        'role': 'Frontend Developer',
        'company': 'Igloo Project',
        'duration': '2022 – 2023',
      },
      {
        'role': 'Product Engineer',
        'company': 'Kanz',
        'duration': '2021 – 2022',
      },
    ];

    return Column(
      children: experiences
          .map(
            (e) => Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: _ExperienceCard(
            role: e['role']!,
            company: e['company']!,
            duration: e['duration']!,
          ),
        ),
      )
          .toList(),
    );
  }
}
class _ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0B1324),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(width: 6, height: 60, color: const Color(0xFF06C167)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    company,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    duration,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
