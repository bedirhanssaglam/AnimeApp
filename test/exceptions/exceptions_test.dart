import 'package:anime/core/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ChopperResponseException Tests', () {
    test('Exception should hold the correct message', () {
      const String message = 'Test error message';

      const ChopperResponseException exception = ChopperResponseException(message);

      expect(exception.message, equals(message));
    });

    test('Should throw ChopperResponseException', () {
      const String message = 'Test error occurred';

      ChopperResponseException? thrownException;

      try {
        throw const ChopperResponseException(message);
      } catch (e) {
        if (e is ChopperResponseException) {
          thrownException = e;
        }
      }

      expect(thrownException, isNotNull);
      expect(thrownException?.message, equals(message));
    });
  });
}
