import 'package:financial_wellness/models/financial_data.dart';
import 'package:financial_wellness/services/financial_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancialService', () {
    final service = FinancialService();

    test(
        'calculateFinancialScore returns "Healthy" when costs <= 25% of net compensation',
        () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 1000);
      final score = service.calculateFinancialScore(data);
      expect(score, 'Healthy');
    });

    test(
        'calculateFinancialScore returns "Average" when costs <= 75% of net compensation',
        () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 5000);
      final score = service.calculateFinancialScore(data);
      expect(score, 'Average');
    });

    test(
        'calculateFinancialScore returns "Unhealthy" when costs > 75% of net compensation',
        () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 8000);
      final score = service.calculateFinancialScore(data);
      expect(score, 'Unhealthy');
    });

    test('calculateFinancialScore handles zero costs correctly', () {
      final data = FinancialData(annualIncome: 100000, monthlyCosts: 0);
      final score = service.calculateFinancialScore(data);
      expect(score, 'Healthy');
    });

    test('calculateFinancialScore handles zero income correctly', () {
      final data = FinancialData(annualIncome: 0, monthlyCosts: 1000);
      final score = service.calculateFinancialScore(data);
      expect(score, 'Unhealthy');
    });
  });
}
