import 'package:anime/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ContextExtensions should return correct ThemeData', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red,
          textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
          colorScheme: const ColorScheme.light(primary: Colors.red),
        ),
        home: const Scaffold(),
      ),
    );

    final BuildContext context = tester.element(find.byType(Scaffold));

    expect(context.themeData.primaryColor, Colors.red);
    expect(context.textTheme.bodyLarge?.color, Colors.black);
    expect(context.colorScheme.primary, Colors.red);
  });

  testWidgets('ContextExtensions should return correct screen size', (WidgetTester tester) async {
    const double screenWidth = 800.0;
    const double screenHeight = 600.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(),
      ),
    );

    tester.binding.window.physicalSizeTestValue = const Size(screenWidth, screenHeight);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    final BuildContext context = tester.element(find.byType(Scaffold));

    expect(context.screenWidth, screenWidth);
    expect(context.screenHeight, screenHeight);
  });
}
