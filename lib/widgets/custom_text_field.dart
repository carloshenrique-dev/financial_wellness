import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.workSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.strongGrey,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 7),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.blue,
          decoration: InputDecoration(
            hintText: '0,000',
            prefixIcon: SizedBox(
              width: 24,
              height: 24,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/dollar_icon.svg',
                  semanticsLabel: 'Money icon',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            CurrencyTextInputFormatter(
              format: NumberFormat.currency(
                locale: 'en_US',
                symbol: '',
                decimalDigits: 3,
              ),
            ),
          ],
          validator: validator,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
