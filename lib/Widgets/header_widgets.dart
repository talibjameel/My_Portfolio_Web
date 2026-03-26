import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Pages/landing_page.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings.name != '/') {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      child: SvgPicture.asset(
        "res/logo.svg",
        width: 300,
        height: 100,
      ),
    );
  }
}

class TopNav extends StatelessWidget {
  const TopNav({super.key});

  @override
  Widget build(BuildContext context) {
    final items = {
      'About': PortfolioPage.aboutKey,
      'Tech Stack': PortfolioPage.techKey,
      'Projects': PortfolioPage.projectsKey,
      'Experience': PortfolioPage.experienceKey,
      'Contact': PortfolioPage.contactKey,
      'Service': PortfolioPage.servicesKey,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final entry in items.entries)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextButton(
              onPressed: () {
                if (entry.key == 'Service') {
                  if (ModalRoute.of(context)?.settings.name != '/services') {
                    Navigator.pushNamed(context, '/services');
                  }
                } else {
                  if (ModalRoute.of(context)?.settings.name != '/') {
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    Future.delayed(const Duration(milliseconds: 300), () {
                      PortfolioPage.scrollToSection(entry.value);
                    });
                  } else {
                    PortfolioPage.scrollToSection(entry.value);
                  }
                }
              },
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(
                  Colors.green.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                entry.key,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
      ],
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
    );
  }
}

class PortfolioDrawer extends StatelessWidget {
  const PortfolioDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final navItems = {
      'About': PortfolioPage.aboutKey,
      'Tech': PortfolioPage.techKey,
      'Projects': PortfolioPage.projectsKey,
      'Experience': PortfolioPage.experienceKey,
      'Service': PortfolioPage.servicesKey,
      'Contact': PortfolioPage.contactKey,
    };

    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("res/profile.jpeg"),
                ),
                SizedBox(height: 12),
                const Text(
                  'Talib Jameel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Software Engineer',
                  style: TextStyle(
                    color: Colors.white, // replaced AppColors.white to keep it simple or use import
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          for (final entry in navItems.entries)
            ListTile(
              title: Text(
                entry.key,
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () {
                Navigator.pop(context);
                if (entry.key == 'Service') {
                  if (ModalRoute.of(context)?.settings.name != '/services') {
                    Navigator.pushNamed(context, '/services');
                  }
                } else {
                  if (ModalRoute.of(context)?.settings.name != '/') {
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    Future.delayed(const Duration(milliseconds: 300), () {
                      PortfolioPage.scrollToSection(entry.value);
                    });
                  } else {
                    PortfolioPage.scrollToSection(entry.value);
                  }
                }
              },
            ),
        ],
      ),
    );
  }
}
