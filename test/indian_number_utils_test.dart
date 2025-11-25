import 'package:test/test.dart';
import 'package:indian_number_utils/indian_number_utils.dart';

void main() {
  group('Indian Number Utils', () {
    test('formatIndianNumber formats numbers with Indian grouping', () {
      expect(formatIndianNumber(1234), '1,234');
      expect(formatIndianNumber(1234567), '12,34,567');
      expect(formatIndianNumber(123456789), '12,34,56,789');
      expect(formatIndianNumber(-50000), '-50,000');
    });

    test('formatIndianCompact formats numbers in compact form', () {
      expect(formatIndianCompact(950), '950');
      expect(formatIndianCompact(1200), '1.2K');
      expect(formatIndianCompact(150000), '1.5L');
      expect(formatIndianCompact(12345678), '1.23Cr');
    });

    test('indianNumberToWords converts numbers to words', () {
      expect(indianNumberToWords(0), 'zero');
      expect(indianNumberToWords(15), 'fifteen');
      expect(indianNumberToWords(150000), 'one lakh fifty thousand');
      expect(indianNumberToWords(12345678), 'one crore twenty three lakh forty five thousand six hundred seventy eight');
    });
  });
}
