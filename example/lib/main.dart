import 'package:flutter/material.dart';
import 'package:indian_number_utils/indian_number_utils.dart';

void main() {
  runApp(const IndianNumberUtilsExampleApp());
}

class IndianNumberUtilsExampleApp extends StatelessWidget {
  const IndianNumberUtilsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleNumber = 12345678;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Indian Number Utils Example')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Original: $sampleNumber"),
              const SizedBox(height: 12),

              Text("Indian Grouped: ${formatIndianNumber(sampleNumber)}"),
              const SizedBox(height: 12),

              Text("Compact: ${formatIndianCompact(sampleNumber)}"),
              const SizedBox(height: 12),

              Text("In Words: ${indianNumberToWords(sampleNumber)}"),
            ],
          ),
        ),
      ),
    );
  }
}
