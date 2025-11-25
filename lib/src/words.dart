/// Convert an integer number into Indian-style words.
/// Examples:
///   0            -> "zero"
///   15           -> "fifteen"
///   1234         -> "one thousand two hundred thirty four"
///   150000       -> "one lakh fifty thousand"
///   12345678     -> "one crore twenty three lakh forty five thousand six hundred seventy eight"
///
/// Only supports whole numbers in the range of about +/- 99,99,99,999.
/// Fractions/decimals are ignored.
String indianNumberToWords(num value) {
  final isNegative = value < 0;
  var v = value.abs().floor();

  if (v == 0) return 'zero';

  final parts = <String>[];

  // Crores (10^7)
  final crores = v ~/ 10000000;
  if (crores > 0) {
    parts.add('${_twoDigitToWords(crores)} crore');
    v %= 10000000;
  }

  // Lakhs (10^5)
  final lakhs = v ~/ 100000;
  if (lakhs > 0) {
    parts.add('${_twoDigitToWords(lakhs)} lakh');
    v %= 100000;
  }

  // Thousands (10^3)
  final thousands = v ~/ 1000;
  if (thousands > 0) {
    parts.add('${_twoDigitToWords(thousands)} thousand');
    v %= 1000;
  }

  // Hundreds
  final hundreds = v ~/ 100;
  if (hundreds > 0) {
    parts.add('${_units[hundreds]} hundred');
    v %= 100;
  }

  if (v > 0) {
    parts.add(_twoDigitToWords(v));
  }

  final result = parts.join(' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  return isNegative ? 'minus $result' : result;
}

final List<String> _units = [
  '',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen',
];

final List<String> _tens = [
  '',
  '',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninety',
];

String _twoDigitToWords(int n) {
  if (n == 0) return '';
  if (n < 20) return _units[n];

  final t = n ~/ 10;
  final u = n % 10;
  if (u == 0) return _tens[t];
  return '${_tens[t]} ${_units[u]}';
}
