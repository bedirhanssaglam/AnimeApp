import 'package:flutter_test/flutter_test.dart';

extension FinderMatchExtensions on Finder {
  void never() => expect(this, findsNothing);
  void once() => expect(this, findsOneWidget);
}
