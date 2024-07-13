import 'package:financial_wellness/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomAppBar has correct preferred size',
      (WidgetTester tester) async {
    const customAppBar = CustomAppBar();
    expect(customAppBar.preferredSize, const Size.fromHeight(kToolbarHeight));
  });

  testWidgets('CustomAppBar displays SVG logo', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
      ),
    );

    // Verify the AppBar background color
    final appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);
    final appBar = tester.widget<AppBar>(appBarFinder);
    expect(appBar.backgroundColor, Colors.white);

    // Verify the SVG logo is displayed
    final svgFinder = find.byType(SvgPicture);
    expect(svgFinder, findsOneWidget);

    final svgPicture = tester.widget<SvgPicture>(svgFinder);
    expect(svgPicture.semanticsLabel, 'Kalshi Logo');
  });

  testWidgets('CustomAppBar title is centered', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
      ),
    );

    // Verify the AppBar title is centered
    final appBarFinder = find.byType(AppBar);
    expect(appBarFinder, findsOneWidget);
    final appBar = tester.widget<AppBar>(appBarFinder);
    expect(appBar.centerTitle, true);
  });
}
