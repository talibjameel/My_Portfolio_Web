import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utility Funcation/custom_button.dart';

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {

            final isMobile = constraints.maxWidth < 500;

            if (isMobile) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello! I'm Talib",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                      onPressed: () { downloadResume();},
                      text: 'Download Resume',
                      icon: true,
            ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: const Text(
                      "Hello! I'm Talib",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  CustomButton(
                    onPressed: (){
                      downloadResume();
                    },
                    text: "Download Resume",
                    icon: true,),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 8),

        // Subtitle
        const Text(
          'Software Engineer | Product Builder | Mobile App Developer',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Colors.greenAccent,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 16),

        // Inspirational Quote
        const Text(
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
        const SizedBox(height: 18),

        // Expanded Description
        const Text(
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
  void downloadResume() async {
    const url = "https://drive.google.com/file/d/1umKG_DZgHTgtWQN2ObyNdG3mGrHJIvfK/view?usp=sharing";
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }
}
