import 'package:financial_wellness/utils/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('AppColors', () {
    test('lightWhite should have correct color value', () {
      expect(AppColors.lightWhite, const Color(0xFFE9EEF2));
    });

    test('blue should have correct color value', () {
      expect(AppColors.blue, const Color(0xFF001C95));
    });

    test('lightGrey should have correct color value', () {
      expect(AppColors.lightGrey, const Color(0xFF4D6475));
    });

    test('mediumGrey should have correct color value', () {
      expect(AppColors.mediumGrey, const Color(0xFF708797));
    });

    test('strongGrey should have correct color value', () {
      expect(AppColors.strongGrey, const Color(0xFF1E2A32));
    });

    test('backgroundColor should have correct color value', () {
      expect(AppColors.backgroundColor, const Color(0xFFF4F8FA));
    });

    test('red should have correct color value', () {
      expect(AppColors.red, const Color(0xFFD32A36));
    });

    test('green should have correct color value', () {
      expect(AppColors.green, const Color(0xFF04C761));
    });

    test('yellow should have correct color value', () {
      expect(AppColors.yellow, const Color(0xFFFFC032));
    });
  });
}
