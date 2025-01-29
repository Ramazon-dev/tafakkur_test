import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String text = newValue.text;

    if (text.length >= 3 && text[2] != '.') {
      text = '${text.substring(0, 2)}.${text.substring(2)}';
    }

    final dateParts = text.split('.');
    if (dateParts.isNotEmpty) {
      final month = int.tryParse(dateParts[0]);
      if (month != null) {
        if (month > 12) {
          text = '12${text.substring(2)}';
        }
      }
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
