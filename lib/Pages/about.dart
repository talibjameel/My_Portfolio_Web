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
          "I’m a Full Stack Developer and Software Engineer with 4+ years of experience "
              "building scalable mobile applications, web platforms, and digital products. "
              "I specialize in Flutter, Dart, React.js, Node.js, Firebase, and modern backend systems, "
              "delivering high-performance solutions across Android, iOS, Web, and Chrome Extensions.\n\n"

              "My expertise includes cross-platform app development, REST API integration, "
              "real-time systems, Firebase services, responsive UI/UX, and scalable application architecture. "
              "I focus on writing clean, maintainable code while creating seamless user experiences "
              "that combine performance, design, and business impact.\n\n"

              "Over the years, I’ve worked on AI-powered applications, SaaS platforms, "
              "social media apps, eCommerce systems, productivity tools, and real-time communication platforms. "
              "I’ve also led development teams, managed project architecture, and delivered production-grade "
              "applications for startups and international clients.\n\n"

              "I’m passionate about transforming ideas into polished digital products through modern technologies, "
              "scalable engineering practices, and user-focused design.",
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
    const url = "https://drive.google.com/file/d/1iDNPc5pNSPkifousDX0phYCB9VJYH5JG/view?usp=sharing";
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }
}
