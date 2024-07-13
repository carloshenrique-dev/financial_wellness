import 'package:financial_wellness/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.isFilled = false,
    required this.onPressed,
  });

  final String text;
  final bool isFilled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isFilled ? Colors.white : AppColors.blue,
          backgroundColor: isFilled ? AppColors.blue : Colors.white,
          side: const BorderSide(color: AppColors.blue, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(96),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.workSans(
            fontSize: 16,
            color: isFilled ? Colors.white : AppColors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
