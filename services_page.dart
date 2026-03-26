import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lib/app_colors.dart';
import 'lib/Widgets/header_widgets.dart';

class ServicesPage extends StatelessWidget {
  static const desktopBreakpoint = 768.0;
  static const tabletBreakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      endDrawer: MediaQuery.of(context).size.width >= desktopBreakpoint 
          ? null 
          : const PortfolioDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isDesktop = width >= desktopBreakpoint;
            final isTablet =
                width >= tabletBreakpoint && width < desktopBreakpoint;

            return Column(
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
                      const Logo(),
                      const Spacer(),
                      if (isDesktop) const TopNav() else const MobileView(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Header Section
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop
                        ? 80
                        : isTablet
                        ? 40
                        : 24,
                    vertical: isDesktop ? 60 : 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'What I Do',
                        style: GoogleFonts.poppins(
                          fontSize: isDesktop ? 48 : 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Crafting digital solutions with modern technologies and best practices',
                        style: GoogleFonts.poppins(
                          fontSize: isDesktop ? 18 : 16,
                          color: AppColors.grey,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),

                // Services Grid
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop
                        ? 80
                        : isTablet
                        ? 40
                        : 24,
                    vertical: isDesktop ? 40 : 20,
                  ),
                  color: AppColors.background2,
                  child: Column(
                    children: [_buildServicesGrid(isDesktop, isTablet)],
                  ),
                ),

                // CTA Section
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop
                        ? 80
                        : isTablet
                        ? 40
                        : 24,
                    vertical: isDesktop ? 60 : 40,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Ready to bring your ideas to life?',
                        style: GoogleFonts.poppins(
                          fontSize: isDesktop ? 32 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Let's discuss how I can help transform your vision into reality",
                        style: GoogleFonts.poppins(
                          fontSize: isDesktop ? 18 : 16,
                          color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _buildCTAButton(context),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildServicesGrid(bool isDesktop, bool isTablet) {
    final services = [
      {
        'title': 'Mobile App Development',
        'description':
            'Build high-quality mobile applications for both Android and iOS platforms, ensuring a seamless user experience.',
        'icon': 'icons/mobile_dev.svg',
        'technologies': ['Flutter', 'Dart', 'Android', 'iOS'],
        'color': AppColors.green,
      },
      {
        'title': 'Web Development',
        'description':
            'Create modern and responsive websites that meet today\'s standards, focusing on user-friendly interfaces.',
        'icon': 'icons/web_dev.svg',
        'technologies': ['Flutter Web', 'HTML', 'CSS', 'JavaScript'],
        'color': AppColors.green,
      },
      {
        'title': 'Backend API Development',
        'description':
            'Develop robust and scalable backend systems that power your applications and services.',
        'icon': 'icons/api.svg',
        'technologies': ['Node.js', 'Express.js', 'REST APIs', 'Postman'],
        'color': AppColors.green,
      },
      {
        'title': 'Cloud Solutions',
        'description':
            'Implement cloud-based solutions that enhance efficiency and scalability for your business.',
        'icon': 'icons/cloud.svg',
        'technologies': ['Firebase', 'AWS S3', 'Cloud Storage', 'Deployment'],
        'color': AppColors.green,
      },
    ];

    final crossAxisCount = isDesktop ? 2 : 1;
    final childAspectRatio = isDesktop ? 1.2 : 1.4;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: isDesktop ? 24 : 16,
        mainAxisSpacing: isDesktop ? 24 : 16,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildModernServiceCard(
          context,
          services[index]['title'] as String,
          services[index]['description'] as String,
          services[index]['icon'] as String,
          services[index]['technologies'] as List<String>,
          services[index]['color'] as Color,
          isDesktop,
        );
      },
    );
  }

  Widget _buildModernServiceCard(
    BuildContext context,
    String title,
    String description,
    String iconPath,
    List<String> technologies,
    Color accentColor,
    bool isDesktop,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.background1, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Add navigation or interaction if needed
        },
        child: Padding(
          padding: EdgeInsets.all(isDesktop ? 32 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(accentColor, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 22 : 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 16 : 14,
                  color: AppColors.grey,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),

              // Technologies
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: technologies.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: accentColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: accentColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const Spacer(),

              // Learn More Arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_forward, color: accentColor, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCTAButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.background1,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          'Get In Touch',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
