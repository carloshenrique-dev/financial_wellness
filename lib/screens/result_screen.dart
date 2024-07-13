import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/widgets/custom_app_bar.dart';
import 'package:financial_wellness/widgets/custom_button.dart';
import 'package:financial_wellness/widgets/custom_container.dart';
import 'package:financial_wellness/widgets/custom_rich_text.dart';
import 'package:financial_wellness/widgets/result_bar.dart';
import 'package:financial_wellness/widgets/security_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _getCalculationResultText(String score) {
    switch (score) {
      case 'Healthy':
        return 'Congratulations!';
      case 'Average':
        return 'There is room for improvement.';
      default:
        return 'Caution!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final score = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            const CustomRichText(
              title: "Here's your ",
              subtitle: 'financial wellness\nscore.',
            ),
            const SizedBox(height: 24),
            CustomContainer(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ResultBar(score: score),
                        const SizedBox(height: 24),
                        Text(
                          _getCalculationResultText(score),
                          style: GoogleFonts.rubik(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.strongGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Your financial wellness score is:',
                          style: GoogleFonts.workSans(
                            fontSize: 14,
                            color: AppColors.lightGrey,
                          ),
                        ),
                        Text(
                          '$score.',
                          style: GoogleFonts.workSans(
                            fontSize: 14,
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 32),
                        CustomButton(
                          text: 'Return',
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SecurityWidget(),
          ],
        ),
      ),
    );
  }
}
