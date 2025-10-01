import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Model/tech_category_model.dart';
import '../Utility Funcation/utility_funcation.dart';
import '../app_colors.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  // Data structured by the categories
  final List<TechCategoryModel> techStackData = const [
    TechCategoryModel(
      title: 'Mobile development',
      skills: ['Flutter', 'Dart'],
    ),
    TechCategoryModel(
      title: 'Web development',
      skills: ['HTML 5', 'CSS 3', 'Bootstrap', 'Javascript', 'React'],
    ),
    TechCategoryModel(
      title: 'Server side',
      skills: ['Flask Restful', 'Node.js', 'Express.js', 'REST APIs', 'Dart Frog'],
    ),
    TechCategoryModel(
      title: 'Databases',
      skills: ['Firebase', 'MongoDB', 'Postgres SQL'],
    ),
    TechCategoryModel(
      title: 'Version controlling & management',
      skills: ['GitHub', 'Jira', 'Notion'],
    ),
    TechCategoryModel(
      title: 'UI/UX Design',
      skills: ['Figma', 'Adobe XD'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Color Definitions (Use your AppColors if defined, or these defaults)
    const Color darkBackground = AppColors.background1;

    return Container(
      color: darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWideScreen = constraints.maxWidth > 900;

          // Widget containing all the text and tag content
          Widget techContent = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Change is inevitable, so I keep on exploring new technology, learn it in a minimal possible way and then build something out of it to see how well i did :)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              // Categories
              ...techStackData.map((category) => TechCategory(
                title: category.title,
                skills: category.skills,
              )),
            ],
          );

          if (isWideScreen) {
            // Side-by-side layout for wide screens
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: techContent,
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SvgPicture.asset(
                      getMainIllustrationPath(),
                      height: 400,
                      width: double.infinity,
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Stacked layout for narrow screens
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: SvgPicture.asset(
                      getMainIllustrationPath(),
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                ),
                techContent,
              ],
            );
          }
        },
      ),
    );
  }
}
class TechCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const TechCategory({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          // Skills in a Wrap layout (tags)
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: skills.map((t) => _TechCard(title: t)).toList(),
          ),
        ],
      ),
    );
  }
}


class _TechCard extends StatefulWidget {
  final String title;
  const _TechCard({required this.title});

  @override
  State<_TechCard> createState() => _TechCardState();
}
class _TechCardState extends State<_TechCard> {
  bool hover = false;

  // Color Definitions
  static const Color primaryGreen = AppColors.green;
  static const Color darkBackground = AppColors.background1;

  @override
  Widget build(BuildContext context) {
    final String svgAssetPath = getIconPath(widget.title);

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          // Green fill color for both states, slightly darker on hover
          color: hover ? primaryGreen.withValues(alpha: 0.8) : primaryGreen,
          borderRadius: BorderRadius.circular(8),
          boxShadow: hover
              ? [
            BoxShadow(
              blurRadius: 8,
              color: primaryGreen.withValues(alpha: 0.4),
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        // Used Row to align Icon and Text
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Essential for Wrap layout
          children: [
            // SVG Icon
            SizedBox(
              width: 16, // Size of the icon
              height: 16,
              child: SvgPicture.asset(
                svgAssetPath,
                colorFilter: const ColorFilter.mode(
                  darkBackground, // Dark tint for the icon
                  BlendMode.srcIn,
                ),
                semanticsLabel: '${widget.title} Icon',
              ),
            ),
            const SizedBox(width: 8), // Spacing between icon and text
            // Text
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: darkBackground, // Dark text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
