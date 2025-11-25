import 'package:test/test.dart';
import 'package:indian_number_utils/indian_number_utils.dart';

void main() {
  group('formatIndianCompact', () {
    test('no unit', () {
      expect(formatIndianCompact(950), '950');
    });

    test('thousand', () {
      expect(formatIndianCompact(1200), '1.2K');
    });

    test('lakh', () {
      expect(formatIndianCompact(150000), '1.5L');
    });

    test('crore', () {
      expect(formatIndianCompact(12300000), '1.23Cr');
    });

    test('negative', () {
      expect(formatIndianCompact(-150000), '-1.5L');
    });
  });
}
