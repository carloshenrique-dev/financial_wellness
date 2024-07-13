import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/widgets/custom_button.dart';

void main() {
  group('CustomButton', () {
    testWidgets('CustomButton displays text correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('CustomButton triggers onPressed callback',
        (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CustomButton));
      expect(pressed, isTrue);
    });

    testWidgets('CustomButton is styled correctly when isFilled is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              isFilled: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final text = tester.widget<Text>(find.text('Test Button'));

      expect(button.style?.foregroundColor?.resolve({}), Colors.white);
      expect(button.style?.backgroundColor?.resolve({}), AppColors.blue);
      expect(text.style?.color, Colors.white);
    });

    testWidgets('CustomButton is styled correctly when isFilled is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              isFilled: false,
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final text = tester.widget<Text>(find.text('Test Button'));

      expect(button.style?.foregroundColor?.resolve({}), AppColors.blue);
      expect(button.style?.backgroundColor?.resolve({}), Colors.white);
      expect(text.style?.color, AppColors.blue);
    });

    testWidgets('CustomButton has correct width and padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));

      expect(button.style?.padding?.resolve({}),
          const EdgeInsets.symmetric(horizontal: 32, vertical: 16));
      expect(
          button.style?.shape?.resolve({}),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(96),
          ));
    });
  });
}
