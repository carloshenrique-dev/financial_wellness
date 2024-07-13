import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:financial_wellness/utils/app_colors.dart';
import 'package:financial_wellness/widgets/result_bar.dart';

void main() {
  group('ResultBar', () {
    testWidgets('ResultBar displays correct color for "Healthy" score',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResultBar(score: 'Healthy'),
          ),
        ),
      );

      final containers = find.byType(Container);
      expect(containers, findsNWidgets(3));

      final containerWidgets =
          tester.widgetList<Container>(containers).toList();
      expect((containerWidgets[0].decoration as BoxDecoration).color,
          AppColors.green);
      expect((containerWidgets[1].decoration as BoxDecoration).color,
          AppColors.green);
      expect((containerWidgets[2].decoration as BoxDecoration).color,
          AppColors.green);
    });

    testWidgets('ResultBar displays correct color for "Average" score',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResultBar(score: 'Average'),
          ),
        ),
      );

      final containers = find.byType(Container);
      expect(containers, findsNWidgets(3));

      final containerWidgets =
          tester.widgetList<Container>(containers).toList();
      expect((containerWidgets[0].decoration as BoxDecoration).color,
          AppColors.yellow);
      expect((containerWidgets[1].decoration as BoxDecoration).color,
          AppColors.yellow);
      expect((containerWidgets[2].decoration as BoxDecoration).color,
          AppColors.lightWhite);
    });

    testWidgets('ResultBar displays correct color for "Unhealthy" score',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResultBar(score: 'Unhealthy'),
          ),
        ),
      );

      final containers = find.byType(Container);
      expect(containers, findsNWidgets(3));

      final containerWidgets =
          tester.widgetList<Container>(containers).toList();
      expect((containerWidgets[0].decoration as BoxDecoration).color,
          AppColors.red);
      expect((containerWidgets[1].decoration as BoxDecoration).color,
          AppColors.lightWhite);
      expect((containerWidgets[2].decoration as BoxDecoration).color,
          AppColors.lightWhite);
    });

    testWidgets('ResultBar containers have correct height and border',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResultBar(score: 'Healthy'),
          ),
        ),
      );

      final containers = find.byType(Container);
      final containerWidgets =
          tester.widgetList<Container>(containers).toList();

      for (final container in containerWidgets) {
        expect(container.constraints!.maxHeight, 16);
      }

      final decoration0 = containerWidgets[0].decoration as BoxDecoration;
      final decoration1 = containerWidgets[1].decoration as BoxDecoration;
      final decoration2 = containerWidgets[2].decoration as BoxDecoration;

      expect(decoration0.border, isNotNull);
      expect(decoration1.border, isNotNull);
      expect(decoration2.border, isNull);
    });
  });
}
