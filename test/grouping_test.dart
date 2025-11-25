import 'package:flutter_test/flutter_test.dart';
import 'package:indian_number_utils/indian_number_utils.dart';

void main() {
  group('formatIndianNumber', () {
    test('small numbers', () {
      expect(formatIndianNumber(0), '0');
      expect(formatIndianNumber(12), '12');
      expect(formatIndianNumber(999), '999');
    });

    test('grouping', () {
      expect(formatIndianNumber(1234), '1,234');
      expect(formatIndianNumber(1234567), '12,34,567');
      expect(formatIndianNumber(123456789), '12,34,56,789');
    });

    test('negative', () {
      expect(formatIndianNumber(-1234), '-1,234');
    });
  });
}
