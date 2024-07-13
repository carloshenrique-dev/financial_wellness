import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/widgets/custom_rich_text.dart';

void main() {
  group('CustomRichText', () {
    testWidgets('CustomRichText displays title and subtitle correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomRichText(
              title: 'Title ',
              subtitle: 'Subtitle',
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;

      expect(textSpan.text, 'Title ');
      expect(textSpan.children, isNotNull);
      expect(textSpan.children!.length, 1);

      final subtitleSpan = textSpan.children![0] as TextSpan;
      expect(subtitleSpan.text, 'Subtitle');
    });

    testWidgets('CustomRichText title has correct style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomRichText(
              title: 'Title ',
              subtitle: 'Subtitle',
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;

      expect(textSpan.style?.fontSize, 18);
      expect(textSpan.style?.color, AppColors.blue);
      expect(textSpan.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('CustomRichText subtitle has correct style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomRichText(
              title: 'Title ',
              subtitle: 'Subtitle',
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;
      final subtitleSpan = textSpan.children![0] as TextSpan;

      expect(subtitleSpan.style?.fontSize, 20);
      expect(subtitleSpan.style?.color, AppColors.blue);
      expect(subtitleSpan.style?.fontWeight, FontWeight.w600);
    });

    testWidgets('CustomRichText is centered', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomRichText(
              title: 'Title ',
              subtitle: 'Subtitle',
            ),
          ),
        ),
      );

      final richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.textAlign, TextAlign.center);
    });
  });
}
