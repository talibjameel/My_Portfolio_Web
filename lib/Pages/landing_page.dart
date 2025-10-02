import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/Pages/project_page.dart';
import 'package:portfolio_web/Pages/tech_stack_page.dart';
import 'package:portfolio_web/Utility%20Funcation/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utility Funcation/social_icons.dart';
import '../app_colors.dart';
import 'about.dart';
import 'exprience_page.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  static const desktopBreakpoint = 1000.0;
  static const tabletBreakpoint = 700.0;
  static const mobileBreakpoint = 500.0;
  static final scrollController = ScrollController();

  // Keys for sections
  static final aboutKey = GlobalKey();
  static final techKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final experienceKey = GlobalKey();
  static final contactKey = GlobalKey();


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
    debugPrint("Font Family: ${const TextStyle(fontFamily: 'TestFont').debugLabel}");
    final items = {
      'About': aboutKey,
      'Tech': techKey,
      'Projects': projectsKey,
      'Experience': experienceKey,
      'Contact': contactKey,
    };
    return Scaffold(
      backgroundColor: AppColors.background1,
      endDrawer: Drawer(
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
                  Text(
                    'Talib Jameel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            for (final entry in items.entries)
              ListTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  Navigator.pop(context);
                  scrollToSection(entry.value);
                },
              ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isDesktop = width >= desktopBreakpoint;
            final isTablet = width >= tabletBreakpoint && width < desktopBreakpoint;

            return SingleChildScrollView(
              controller: PortfolioPage.scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // NAV / HEADER
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop
                          ? 38
                          : isTablet
                          ? 20
                          : 6, // mobile
                      vertical: isDesktop
                          ? 18
                          : isTablet
                          ? 12
                          : 6, // mobile
                    ),
                    child: Row(
                      children: [
                        const _Logo(),
                        const Spacer(),
                        if (isDesktop)
                          const _TopNav()
                        else
                          _MobileView(),
                      ],
                    ),
                  ),

                  // HERO
                  Container(
                    color: AppColors.background1,
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop
                          ? 80
                          : isTablet
                          ? 40
                          : 24, // mobile
                      vertical: isDesktop
                          ? 60
                          : isTablet
                          ? 50
                          : 10, // mobile
                    ),
                    constraints: const BoxConstraints(minHeight: 380),
                    child: isDesktop
                        ? _HeroDesktopView()
                        : _HeroTabletView(isTablet: isTablet),
                  ),

                  // About
                  Container(
                    key: PortfolioPage.aboutKey,
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 40,),
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
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 40,),
                    color: AppColors.background1,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SectionTitle(
                            title: 'Tech Stack',
                            color: AppColors.green,
                          ),
                          SizedBox(height: 18),
                          TechStackSection(),
                        ],
                      ),
                    ),
                  ),

                  // Projects
                  Container(
                    key: PortfolioPage.projectsKey,
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 40,),
                    color: AppColors.background2,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SectionTitle(
                            title: 'Projects',
                            color: AppColors.green,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Stuff I loved working with',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 12),
                          ProjectsRow(),
                        ],
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
    return  SvgPicture.asset(
      width: 300,
      height: 100,
    "res/logo.svg",
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

/// For tablet view
class _HeroTabletView extends StatelessWidget {
  final bool isTablet;
  const _HeroTabletView({required this.isTablet});

  @override
  Widget build(BuildContext context) {
    /// Tablet view
    if (isTablet) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// brand tag
                CustomButton(
                    text: "Software Engineer",
                    icon: false,
                    onPressed: (){
                      PortfolioPage.scrollToSection(PortfolioPage.aboutKey);
                    },
                ),
                const SizedBox(height: 8),

                /// brand name
                Text(
                  "Talib\nJameel",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),

                /// job role
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_right, color: AppColors.green, size: 45),
                    const SizedBox(width: 8),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Flutter Developer',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// social icons
                SocialIconsRow(),
                const SizedBox(height: 30),

                /// Let's chat
                TextButton(
                  onPressed: () {
                    PortfolioPage.scrollToSection(PortfolioPage.contactKey);
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(
                      AppColors.green.withValues(alpha: .2),
                    ),
                  ),
                  child: Text(
                    "Let's chat!".toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.green,
                      decorationThickness: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                /// Insight
                Wrap(
                  spacing: 20,
                  runSpacing: 15,
                  children: [
                    _buildInsightItem('2', 'Years\nExperience'),
                    _buildInsightItem('15', 'Projects\nCompleted'),
                    _buildInsightItem('110k', 'Content\nReached & views'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // RIGHT SIDE: Profile Image
          Expanded(
            flex: 1,
            child:  Stack(
              alignment: Alignment.center,
              children: [
                /// background circle
                Container(
                  width: 450,
                  height: 430,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background2,
                  ),
                ),

                /// profile image
                Container(
                  width: 540,
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
          ),
        ],
      );
    }

    // Mobile view: Column, image centered below text
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// brand tag
        MaterialButton(
          onPressed: () {},
          color: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text(
            'Software Engineer',
            style: TextStyle(color: AppColors.background1),
          ),
        ),
        const SizedBox(height: 8),

        /// brand name
        Text(
          "Talib\nJameel",
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),

        /// job role
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.arrow_right, color: AppColors.green, size: 45),
            const SizedBox(width: 8),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Flutter Developer',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        /// social icons
        SocialIconsRow(),
        const SizedBox(height: 30),

        /// Let's chat
        TextButton(
          onPressed: () {
            PortfolioPage.scrollToSection(PortfolioPage.contactKey);
          },
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              AppColors.green.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            "Let's chat!".toUpperCase(),
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.green,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.green,
              decorationThickness: 1,
            ),
          ),
        ),
        const SizedBox(height: 40),

        /// Mobile profile image
        Center(
          child: Container(
            width: 200,
            height: 200,
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
              child: Image.asset('res/profile.jpeg', fit: BoxFit.cover),
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
              CustomButton(
                onPressed: (){
                  PortfolioPage.scrollToSection(PortfolioPage.aboutKey);
                },
                  text: "Software Engineer",
                  icon: false),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_right, color: AppColors.green, size: 45),
                      const SizedBox(width: 8),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Flutter Developer',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: SocialIconsRow(),
                  ),
                ],
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
              Wrap(
                spacing: 20,
                runSpacing: 15,
                children: [
                  _buildInsightItem('2', 'Years\nExperience'),
                  _buildInsightItem('15', 'Projects\nCompleted'),
                  _buildInsightItem('110k', 'Content\nReached & views'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 26),

        /// Profile Image with background circle
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                /// background circle
                Container(
                  width: 450,
                  height: 430,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background2,
                  ),
                ),

                /// profile image
                Container(
                  width: 540,
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

Widget _buildInsightItem(String value, String label) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 25,
          color: AppColors.white,
        ),
      ),
      const SizedBox(width: 5),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 10,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
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
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
