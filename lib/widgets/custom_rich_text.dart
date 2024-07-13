import 'package:financial_wellness/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.blue,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
