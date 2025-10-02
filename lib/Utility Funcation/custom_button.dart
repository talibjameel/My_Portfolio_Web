import 'package:flutter/material.dart';
import '../app_colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool icon;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.text, required this.icon,  this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}
class _CustomButtonState extends State<CustomButton> {
  bool hover = false;

  static const Color primaryGreen = AppColors.green;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: hover ? AppColors.background2 : primaryGreen,
            borderRadius: BorderRadius.circular(6),
            boxShadow: hover
                ? [
              BoxShadow(
                blurRadius: 16,
                spreadRadius: 3,
                color: primaryGreen.withValues(alpha: 0.6),
                offset: const Offset(0, 4),
              ),
            ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon)
                Icon(
                  Icons.my_library_books,
                  size: 18,
                  color: hover ? primaryGreen : AppColors.background2,
                ),
              const SizedBox(width: 8),
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: hover ? primaryGreen : AppColors.background2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
