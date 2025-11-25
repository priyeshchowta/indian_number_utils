import 'package:flutter_test/flutter_test.dart';
import 'package:indian_number_utils/indian_number_utils.dart';

void main() {
  group('indianNumberToWords', () {
    test('zero', () {
      expect(indianNumberToWords(0), 'zero');
    });

    test('simple', () {
      expect(indianNumberToWords(15), 'fifteen');
      expect(indianNumberToWords(123), 'one hundred twenty three');
    });

    test('lakh and crore', () {
      expect(
        indianNumberToWords(150000),
        'one lakh fifty thousand',
      );
      expect(
        indianNumberToWords(12345678),
        'one crore twenty three lakh forty five thousand six hundred seventy eight',
      );
    });

    test('negative', () {
      expect(indianNumberToWords(-123), 'minus one hundred twenty three');
    });
  });
}
