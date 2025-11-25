# Indian Number Utils

A lightweight and powerful utility package for formatting and converting numbers using the **Indian numbering system** (lakh/crore).  
Perfect for **fintech, ecommerce, dashboards, calculators, banking apps**, and any app targeting the Indian market.

## ✨ Features

- ✔ Indian comma formatting  
- ✔ Compact formatting (K / L / Cr)  
- ✔ Number-to-words (Indian style)  
- ✔ Supports negative values  
- ✔ Zero dependencies  
- ✔ Works in Dart & Flutter apps  
- ✔ Clean API, production-ready  

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  indian_number_utils: ^0.1.0
```

Then import in your Dart/Flutter code:

```dart
import 'package:indian_number_utils/indian_number_utils.dart';
```

## 🚀 Usage

### 1. Indian Number Formatting (1,23,45,678)

Format numbers with Indian-style comma separators:

```dart
formatIndianNumber(1234);        // 1,234
formatIndianNumber(1234567);     // 12,34,567
formatIndianNumber(123456789);   // 12,34,56,789
formatIndianNumber(-50000);      // -50,000
```

### 2. Compact Number Formatting (1.2K / 1.5L / 1.23Cr)

Format large numbers in a compact, human-readable format:

```dart
formatIndianCompact(950);          // 950
formatIndianCompact(1200);         // 1.2K
formatIndianCompact(150000);       // 1.5L
formatIndianCompact(12345678);     // 1.23Cr
formatIndianCompact(-150000);      // -1.5L
formatIndianCompact(123456789, decimals: 3);  // 12.346Cr
```

### 3. Number to Words (Indian Style)

Convert numbers to their word representation:

```dart
indianNumberToWords(0);          // zero
indianNumberToWords(15);         // fifteen
indianNumberToWords(1234);       // one thousand two hundred thirty four
indianNumberToWords(150000);     // one lakh fifty thousand
indianNumberToWords(12345678);   // one crore twenty three lakh forty five thousand six hundred seventy eight
indianNumberToWords(-123);       // minus one hundred twenty three
```

### 4. Advanced Usage

#### Customizing Compact Formatting

You can customize the number of decimal places in compact formatting:

```dart
formatIndianCompact(12345678, decimals: 1);    // 1.2Cr
formatIndianCompact(12345678, decimals: 0);    // 1Cr
```

#### Using IndianCompactUnit

The package also exports an `IndianCompactUnit` enum that represents the different compact units used:

```dart
enum IndianCompactUnit {
  none,    // No unit (e.g., 999)
  thousand,// K (e.g., 1.2K)
  lakh,    // L (e.g., 1.5L)
  crore,   // Cr (e.g., 1.23Cr)
}
```

## 🧪 Example App

Try the example app to see the package in action:

```bash
cd example
flutter run
```

Or run directly:

```bash
flutter run -t lib/main.dart
```

The example demonstrates all the features with interactive examples.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
