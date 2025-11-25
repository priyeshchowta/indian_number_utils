/// Format an integer using the Indian numbering system grouping:
/// 1234      -> 1,234
/// 1234567   -> 12,34,567
/// 123456789 -> 12,34,56,789
String formatIndianNumber(num value) {
  final isNegative = value < 0;
  final abs = value.abs().floor(); // we only group integer part here

  final digits = abs.toString();
  if (digits.length <= 3) {
    return _withSign(digits, isNegative);
  }

  final last3 = digits.substring(digits.length - 3);
  var rest = digits.substring(0, digits.length - 3);

  final parts = <String>[];
  while (rest.length > 2) {
    parts.insert(0, rest.substring(rest.length - 2));
    rest = rest.substring(0, rest.length - 2);
  }
  if (rest.isNotEmpty) {
    parts.insert(0, rest);
  }

  final grouped = '${parts.join(',')},$last3';
  return _withSign(grouped, isNegative);
}

String _withSign(String s, bool isNegative) => isNegative ? '-$s' : s;
