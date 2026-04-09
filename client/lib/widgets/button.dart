import 'package:flutter/material.dart';
import 'package:shop_nexus/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;
  final bool isLoading;
  final IconData? icon;

  const CustomButton({
    super.key,
    this.title,
    this.onPressed,
    this.color = AppTheme.primary,
    this.textColor = Colors.white,
    this.borderRadius = 18,
    this.height = 56,
    this.width = double.infinity,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isDisabled ? 0.65 : 1,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 4,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    color: textColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18, color: textColor),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      title ?? 'Button',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
