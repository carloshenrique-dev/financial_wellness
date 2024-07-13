class FinancialData {
  final double annualIncome;
  final double monthlyCosts;

  FinancialData({
    required this.annualIncome,
    required this.monthlyCosts,
  });

  double get annualNetCompensation => annualIncome * 0.92;
  double get annualCosts => monthlyCosts * 12;

  String get financialScore {
    double netCompensation = annualNetCompensation;
    double costs = annualCosts;

    if (costs <= 0.25 * netCompensation) {
      return 'Healthy';
    } else if (costs <= 0.75 * netCompensation) {
      return 'Average';
    } else {
      return 'Unhealthy';
    }
  }
}
