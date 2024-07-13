import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/widgets/custom_app_bar.dart';
import 'package:financial_wellness/widgets/custom_button.dart';
import 'package:financial_wellness/widgets/custom_container.dart';
import 'package:financial_wellness/widgets/custom_rich_text.dart';
import 'package:financial_wellness/widgets/security_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/financial_data.dart';
import '../services/financial_service.dart';
import '../widgets/custom_text_field.dart';

class FinancialFormScreen extends StatefulWidget {
  const FinancialFormScreen({super.key});

  @override
  State<FinancialFormScreen> createState() => _FinancialFormScreenState();
}

class _FinancialFormScreenState extends State<FinancialFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _annualIncomeController = TextEditingController();
  final _monthlyCostsController = TextEditingController();

  void _calculateScore() {
    if (_formKey.currentState!.validate()) {
      final data = FinancialData(
        annualIncome: double.parse(_annualIncomeController.text),
        monthlyCosts: double.parse(_monthlyCostsController.text),
      );
      final service = FinancialService();

      Navigator.pushNamed(
        context,
        '/result',
        arguments: service.calculateFinancialScore(data),
      );
    }
  }

  @override
  void dispose() {
    _annualIncomeController.dispose();
    _monthlyCostsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: ListView(
            children: [
              const CustomRichText(
                title: "Let's find out your ",
                subtitle: 'financial wellness\nscore.',
              ),
              const SizedBox(height: 24),
              CustomContainer(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'Financial wellness test',
                        style: GoogleFonts.rubik(
                          color: AppColors.strongGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Enter your financial information below',
                        style: GoogleFonts.workSans(
                          color: AppColors.strongGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _annualIncomeController,
                              label: 'Annual Income',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your annual income';
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) <= 0) {
                                  return 'Please enter a valid number greater than zero';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _monthlyCostsController,
                              label: 'Monthly Costs',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your monthly costs';
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) <= 0) {
                                  return 'Please enter a valid number greater than zero';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              onPressed: _calculateScore,
                              isFilled: true,
                              text: 'Continue',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const SecurityWidget()
            ],
          ),
        ),
      ),
    );
  }
}
