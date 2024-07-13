import 'package:financial_wellness/screens/financial_form_screen.dart';
import 'package:financial_wellness/screens/result_screen.dart';
import 'package:financial_wellness/utils/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FinancialWellness());
}

class FinancialWellness extends StatelessWidget {
  const FinancialWellness({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Wellness App',
      initialRoute: '/',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.lightWhite.withOpacity(.6),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.lightWhite.withOpacity(.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.lightWhite.withOpacity(.6),
            ),
          ),
        ),
      ),
      routes: {
        '/': (context) => const FinancialFormScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
