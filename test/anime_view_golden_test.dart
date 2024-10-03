import 'package:anime/features/anime/presentation/view/anime_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimeView Golden Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimeView(),
      ),
    );

    await expectLater(
      find.byType(AnimeView),
      matchesGoldenFile('goldens/anime_view_golden.png'),
    );
  });
}
