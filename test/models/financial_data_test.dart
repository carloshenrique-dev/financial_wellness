import 'package:financial_wellness/models/financial_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialData', () {
    test('annualNetCompensation returns correct value', () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 2000);
      expect(data.annualNetCompensation, 92000);
    });

    test('annualCosts returns correct value', () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 2000);
      expect(data.annualCosts, 24000);
    });

    test(
        'financialScore returns "Healthy" when costs <= 25% of net compensation',
        () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 1000);
      expect(data.financialScore, 'Healthy');
    });

    test(
        'financialScore returns "Average" when costs <= 75% of net compensation',
        () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 5000);
      expect(data.financialScore, 'Average');
    });

    test(
        'financialScore returns "Unhealthy" when costs > 75% of net compensation',
        () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 8000);
      expect(data.financialScore, 'Unhealthy');
    });

    test('financialScore handles zero costs correctly', () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 0);
      expect(data.financialScore, 'Healthy');
    });

    test('financialScore handles zero income correctly', () {
      final data = FinancialData(annualIncome: 0, monthlyCosts: 1000);
      expect(data.financialScore, 'Unhealthy');
    });
  });
}
