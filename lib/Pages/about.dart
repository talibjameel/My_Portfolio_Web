import 'package:flutter/material.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          "Hello! I'm Talib",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.4,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 8),

        // Subtitle
        Text(
          'Software Engineer | Product Builder | Flutter Enthusiast',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Colors.greenAccent,
            letterSpacing: 0.8,
          ),
        ),
        SizedBox(height: 16),

        // Inspirational Quote
        Text(
          "“If you don’t tell the world who you are, "
              "the world won’t know how great you can be.”",
          style: TextStyle(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            height: 1.6,
            color: Colors.white70,
            shadows: [
              Shadow(
                color: Colors.black45,
                blurRadius: 4,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        SizedBox(height: 18),

        // Expanded Description
        Text(
          "I am a passionate software engineer with over 2 years of experience turning ideas "
              "into fully-functional digital products. My journey started with building small apps, "
              "and today I specialize in creating scalable, high-performance systems and mobile "
              "applications that users love.\n\n"
              "💡 Flutter Developer: Expert in crafting seamless, cross-platform apps with Flutter & Dart. "
              "I focus on clean, maintainable code that delivers real-world business value.\n\n"
              "🎨 UI/UX Craftsmanship: Skilled in designing visually appealing, responsive interfaces "
              "and integrating them with robust backends using Firebase and REST APIs.\n\n"
              "⚡ Code Quality & Performance: I prioritize scalability, readability, and efficiency "
              "to ensure apps are fast, reliable, and easy to maintain.\n\n"
              "🚀 Agile Mindset: Experienced in agile workflows, pixel-perfect designs, and delivering "
              "projects on time without compromising quality.\n\n"
              "🌟 Goal: To create innovative digital experiences that delight users and make a tangible impact.",
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
