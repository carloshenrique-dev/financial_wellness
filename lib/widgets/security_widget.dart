import 'package:financial_wellness/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/lock.svg',
            semanticsLabel: 'Lock icon',
          ),
          const SizedBox(height: 16),
          Text(
            "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
            style: GoogleFonts.workSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.mediumGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
