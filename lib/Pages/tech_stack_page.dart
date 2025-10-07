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
      title: 'Mobile Development',
      skills: ['Flutter', 'Dart', 'Android', 'iOS',],
    ),
    TechCategoryModel(
      title: 'Web Development',
      skills: ['Flutter Web', 'WordPress'],
    ),
    TechCategoryModel(
      title: 'Backend & APIs',
      skills: ['Node.js', 'Express.js','REST APIs', 'Postman'],
    ),
    TechCategoryModel(
      title: 'Databases & Cloud',
      skills: ['Firebase', 'PostgresSQL', 'AWS S3', ],
    ),
    TechCategoryModel(
      title: 'State Management ',
      skills: ['Provider', 'RiverPod', 'Responsive Design'],
    ),
    TechCategoryModel(
      title: 'Tools',
      skills: [ 'Github','Jira', 'ClickUp', 'Windsurf'],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    const Color darkBackground = AppColors.background1;

    return Container(
      color: darkBackground,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWideScreen = constraints.maxWidth > 900;


          Widget techContent = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Change is inevitable, so I keep on exploring new technology, learn it in a minimal possible way and then build something out of it to see how well i did.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              ...techStackData.map((category) => TechCategory(
                title: category.title,
                skills: category.skills,
              )),
            ],
          );

          if (isWideScreen) {
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
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
          ),

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
          color: hover ? AppColors.background2 : primaryGreen,
          borderRadius: BorderRadius.circular(6),
          boxShadow: hover
              ? [
            BoxShadow(
              blurRadius: 16, // Thicker glow
              spreadRadius: 3,
              color: primaryGreen.withValues(alpha: 0.6),
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 14,
              height: 14,
              child: SvgPicture.asset(
                svgAssetPath,
                colorFilter: ColorFilter.mode(
                  hover ? primaryGreen : darkBackground,
                  BlendMode.srcIn,
                ),
                semanticsLabel: '${widget.title} Icon',
              ),
            ),
            const SizedBox(width: 6),

            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12, // Smaller font
                color: hover ? primaryGreen : darkBackground, // Green on hover
              ),
            ),
          ],
        ),
      ),
    );
  }
}
