/// Units used in Indian compact formatting.
enum IndianCompactUnit {
  none,
  thousand,
  lakh,
  crore,
}

/// Format a number into a compact Indian-style string.
///
/// Examples:
///   950        -> "950"
///   1200       -> "1.2K"
///   150000     -> "1.5L"
///   12345678   -> "1.23Cr"
///
/// [decimals] controls max decimal places.
String formatIndianCompact(
  num value, {
  int decimals = 2,
}) {
  final isNegative = value < 0;
  var v = value.abs();

  IndianCompactUnit unit = IndianCompactUnit.none;
  num divisor = 1;

  // Determine scale
  if (v >= 10000000) {
    unit = IndianCompactUnit.crore;
    divisor = 10000000; // 1 crore
  } else if (v >= 100000) {
    unit = IndianCompactUnit.lakh;
    divisor = 100000; // 1 lakh
  } else if (v >= 1000) {
    unit = IndianCompactUnit.thousand;
    divisor = 1000;
  }

  // No compact unit → return plain number
  if (unit == IndianCompactUnit.none) {
    return _withSign(v.toStringAsFixed(0), isNegative);
  }

  final scaled = v / divisor;

  // Clamp decimals (can't be negative)
  final dp = decimals < 0 ? 0 : decimals;
  String text = scaled.toStringAsFixed(dp);

  // Remove trailing zeros and optional decimal point
  if (text.contains('.')) {
    text = text.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  // Old stable Dart doesn't support switch-expressions → use standard switch
  String suffix;
  switch (unit) {
    case IndianCompactUnit.thousand:
      suffix = 'K';
      break;
    case IndianCompactUnit.lakh:
      suffix = 'L';
      break;
    case IndianCompactUnit.crore:
      suffix = 'Cr';
      break;
    case IndianCompactUnit.none:
    default:
      suffix = '';
  }

  return _withSign('$text$suffix', isNegative);
}

String _withSign(String s, bool isNegative) => isNegative ? '-$s' : s;
