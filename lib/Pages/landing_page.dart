import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/Pages/project_page.dart';
import 'package:portfolio_web/Pages/tech_stack_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utility Funcation/social_icons.dart';
import '../app_colors.dart';
import 'about.dart';
import 'exprience_page.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  static const desktopBreakpoint = 1000.0;
  static const tabletBreakpoint = 700.0;

  // Keys for sections
  static final aboutKey = GlobalKey();
  static final techKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final experienceKey = GlobalKey();
  static final contactKey = GlobalKey();

  static final scrollController = ScrollController();

  static void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isDesktop = width >= desktopBreakpoint;
            final isTablet =
                width >= tabletBreakpoint && width < desktopBreakpoint;

            return SingleChildScrollView(
              controller: PortfolioPage.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // NAV / HEADER
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 18,),
                    child: Row(
                      children: [
                        const _Logo(),
                        const Spacer(),
                        if (isDesktop) const _TopNav() else _MobileView(),
                      ],
                    ),
                  ),

                  // HERO
                  Container(
                    color: AppColors.background1,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 80 : 24,
                      vertical: 40,
                    ),
                    constraints: const BoxConstraints(minHeight: 380),
                    child: isDesktop
                        ? _HeroDesktopView()
                        : _HeroTabletView(isTablet: isTablet),
                  ),

                  // About
                  Container(
                    key: PortfolioPage.aboutKey,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 80 : 24,
                      vertical: 40,
                    ),
                    color: AppColors.background2,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SectionTitle(
                            title: 'About Me',
                            color: AppColors.green,
                          ),
                          SizedBox(height: 12),
                          AboutText(),
                        ],
                      ),
                    ),
                  ),

                  // Tech Stack
                  Container(
                    key: PortfolioPage.techKey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 48,
                    ),
                    color: AppColors.background1,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SectionTitle(
                              title: 'Tech Stack',
                              color: Colors.white,
                            ),
                            SizedBox(height: 18),
                            TechStackSection(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Projects
                  Container(
                    key: PortfolioPage.projectsKey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 48,
                    ),
                    color: AppColors.background2,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SectionTitle(
                              title: 'Projects',
                              color: Colors.white,
                            ),
                            SizedBox(height: 12),
                            ProjectsRow(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Experience Timeline
                  Container(
                    key: PortfolioPage.experienceKey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 48,
                    ),
                    color: AppColors.background1,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SectionTitle(
                              title: 'Experience',
                              color: Colors.white,
                            ),
                            SizedBox(height: 24),
                            ExperienceTimeline(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Contact / Footer
                  Container(
                    key: PortfolioPage.contactKey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 40,
                    ),
                    color: AppColors.background2,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Column(
                          children: [
                            Text(
                              'Let\'s build something together',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF06C167),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                child: Text("Book a 45 mins session"),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _SocialIcon(
                                  icon: Icons.linked_camera,
                                  url: 'https://github.com/',
                                ),
                                _SocialIcon(
                                  icon: Icons.link,
                                  url: 'https://linkedin.com/',
                                ),
                                _SocialIcon(
                                  icon: Icons.alternate_email,
                                  url: 'https://twitter.com/',
                                ),
                                _SocialIcon(
                                  icon: Icons.book,
                                  url: 'https://medium.com/',
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Designed & Crafted by Muhammad Talib',
                              style: GoogleFonts.poppins(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ======================== Widgets ========================

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '<Talib>',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _TopNav extends StatelessWidget {
  const _TopNav();

  @override
  Widget build(BuildContext context) {
    final items = {
      'About': PortfolioPage.aboutKey,
      'Tech': PortfolioPage.techKey,
      'Projects': PortfolioPage.projectsKey,
      'Experience': PortfolioPage.experienceKey,
      'Contact': PortfolioPage.contactKey,
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
                PortfolioPage.scrollToSection(entry.value);
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

/// For Mobile view
class _MobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu, color: Colors.white),
    );
  }
}

/// For tablet view
class _HeroTabletView extends StatelessWidget {
  final bool isTablet;
  const _HeroTabletView({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I'm Talib",
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 32 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A software engineer turned product engineer',
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 12),
        Text(
          'Software engineer with a mind for building products and systems who has developed solutions, MVPs, products and systems for more than 6 years.',
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            width: isTablet ? 180 : 140,
            height: isTablet ? 180 : 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12,
                  color: Colors.black12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/profile.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}

/// For desktop view
class _HeroDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Main title
              MaterialButton(
                onPressed: () {},
                color: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Software Engineer'),
              ),
              const SizedBox(height: 8),

              /// Name
              Text(
                "Talib Jameel",
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),

              /// Job Role
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_right, color: AppColors.green, size: 45),
                        Text(
                          'Flutter Developer',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            decorationColor: AppColors.green,
                            decorationThickness: 1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SocialIconsRow()
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              /// Let's chat
              TextButton(
                onPressed: () {
                  PortfolioPage.scrollToSection(PortfolioPage.contactKey);
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                    Colors.green.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  "Let's chat!".toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.green,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(height: 60),

              /// Insight
              Row(
                spacing: 30,
                children: [
                  /// Years of experience
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                        '2',
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Years\nExperience',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  /// Project Completed
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                        '15',
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Projects\nCompleted',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  /// content reached & views
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                        '110k',
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Content \n Reached & views',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 36),

        /// Profile Image with background circle
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                /// background circle
                Container(
                  width: 460,
                  height: 430,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background2,
                  ),
                ),

                /// profile image
                Container(
                  width: 560,
                  height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      'res/profile_image.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}



// ======================== Social Icons ========================
class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () async {
            if (await canLaunchUrl(Uri.parse(url))) launchUrl(Uri.parse(url));
          },
          child: Icon(icon, color: Colors.white70),
        ),
      ),
    );
  }
}


// ======================== Sections ========================

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  const SectionTitle({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
