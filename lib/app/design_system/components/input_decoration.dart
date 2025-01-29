import 'package:flutter/material.dart';
import 'package:tafakkur_test/app/design_system/design_system.dart';

class InputDecorationAuth extends InputDecoration {
  InputDecorationAuth({
    super.prefix,
    super.prefixIcon,
    super.prefixText,
    super.prefixStyle,
    super.suffix,
    super.suffixIcon,
    super.contentPadding,
    super.filled,
    super.fillColor,
    super.hintText,
    super.hintStyle,
    final BorderRadius? borderRadius,
    final Color? borderColor,
  }) : super(
    prefixIconConstraints: const BoxConstraints(),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: borderColor ?? Colors.teal),
      borderRadius: borderRadius ?? BorderRadius.circular(16).r,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(16).r,
      borderSide:
      BorderSide(color: borderColor ?? Colors.teal),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(16).r,
      borderSide:
      BorderSide(color: borderColor ?? Colors.teal),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(16).r,
      borderSide:
      BorderSide(color: borderColor ?? Colors.teal),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(16).r,
      borderSide:
      BorderSide(color: borderColor ?? Colors.teal),
    ),
    border: OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(16).r,
      borderSide:
      BorderSide(color: borderColor ?? Colors.teal),
    ),
  );
}
