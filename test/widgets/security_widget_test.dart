import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/widgets/security_widget.dart';

void main() {
  group('SecurityWidget', () {
    testWidgets('displays lock icon correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SecurityWidget(),
          ),
        ),
      );

      final svgFinder = find.byType(SvgPicture);
      expect(svgFinder, findsOneWidget);

      final svgPicture = tester.widget<SvgPicture>(svgFinder);
      expect(svgPicture.semanticsLabel, 'Lock icon');
    });

    testWidgets('displays security text correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SecurityWidget(),
          ),
        ),
      );

      final textFinder = find.text(
          "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.");
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.fontSize, 12);
      expect(textWidget.style?.fontWeight, FontWeight.w400);
      expect(textWidget.style?.color, AppColors.mediumGrey);
      expect(textWidget.textAlign, TextAlign.center);
    });
  });
}
