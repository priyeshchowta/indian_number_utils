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

  if (v >= 1e7) {
    unit = IndianCompactUnit.crore;
    divisor = 1e7; // 1 crore
  } else if (v >= 1e5) {
    unit = IndianCompactUnit.lakh;
    divisor = 1e5; // 1 lakh
  } else if (v >= 1e3) {
    unit = IndianCompactUnit.thousand;
    divisor = 1e3;
  }

  if (unit == IndianCompactUnit.none) {
    return _withSign(v.toStringAsFixed(0), isNegative);
  }

  final scaled = v / divisor;
  // Clamp decimals to non-negative
  final dp = decimals < 0 ? 0 : decimals;
  String text = scaled.toStringAsFixed(dp);

  // Remove trailing zeros and decimal point if unnecessary
  if (text.contains('.')) {
    text = text.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  final suffix = switch (unit) {
    IndianCompactUnit.thousand => 'K',
    IndianCompactUnit.lakh => 'L',
    IndianCompactUnit.crore => 'Cr',
    IndianCompactUnit.none => '',
  };

  return _withSign('$text$suffix', isNegative);
}

String _withSign(String s, bool isNegative) => isNegative ? '-$s' : s;
