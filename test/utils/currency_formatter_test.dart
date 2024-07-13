import 'package:financial_wellness/utils/currency_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('CurrencyTextInputFormatter', () {
    final formatter = CurrencyTextInputFormatter(
        format: NumberFormat.currency(symbol: '', decimalDigits: 2));

    test('formatEditUpdate should format input correctly', () {
      const oldValue = TextEditingValue(text: '');
      const newValue = TextEditingValue(text: '123456');
      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '1,234.56');
    });

    test('formatEditUpdate should handle negative values when enabled', () {
      final formatterNegative = CurrencyTextInputFormatter(
          format: NumberFormat.currency(symbol: '', decimalDigits: 2),
          enableNegative: true);
      const oldValue = TextEditingValue(text: '');
      const newValue = TextEditingValue(text: '-123456');
      final result = formatterNegative.formatEditUpdate(oldValue, newValue);

      expect(result.text, '-1,234.56');
    });

    test(
        'formatEditUpdate should ignore negative sign when negative values are disabled',
        () {
      final formatterNoNegative = CurrencyTextInputFormatter(
          format: NumberFormat.currency(symbol: '', decimalDigits: 2),
          enableNegative: false);
      const oldValue = TextEditingValue(text: '');
      const newValue = TextEditingValue(text: '-123456');
      final result = formatterNoNegative.formatEditUpdate(oldValue, newValue);

      expect(result.text, '1,234.56');
    });

    test('formatEditUpdate should handle empty input correctly', () {
      const oldValue = TextEditingValue(text: '123');
      const newValue = TextEditingValue(text: '');
      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
    });

    test('formatEditUpdate should handle multiple zeros correctly', () {
      const oldValue = TextEditingValue(text: '0');
      const newValue = TextEditingValue(text: '000');
      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
    });
  });
}
