import 'package:flutter/material.dart';
import 'package:tafakkur_test/app/design_system/design_system.dart';

class PrimaryButton extends ElevatedButton {
  PrimaryButton({
    super.key,
    required super.onPressed,
    required String text,
    final EdgeInsetsGeometry? padding,
    final Size? maximumSize,
    final Size? minimumSize,
    final Size? size,
    final bool? isLoading,
    final Color? circularColor,
  }) : super(
    child: isLoading == true
        ? Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: circularColor ?? Colors.white,
      ),
    )
        : Text(
      text,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    style: ElevatedButton.styleFrom(
      maximumSize: maximumSize,
      minimumSize: minimumSize,
      padding: padding,
      fixedSize: maximumSize == null ? size ?? Size(312.r, 50.h) : null,
      backgroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  );
}

class SecondaryButton extends ElevatedButton {
  SecondaryButton({
    super.key,
    required super.onPressed,
    required String text,
    Size? size,
    Color? borderColor,
    Color? textColor,
    double? elevation,
  }) : super(
    child: Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
          color: textColor ?? Colors.black,
        ),
      ),
    ),
    style: ElevatedButton.styleFrom(
      fixedSize: size ?? Size(353.r, 54.h),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: borderColor ?? Colors.white),
      ),
    ),
  );
}

class TextButtonWidget extends TextButton {
  TextButtonWidget({
    super.key,
    required super.onPressed,
    required String text,
    final bool? isLoading,
    final Color? circularColor,
  }) : super(
    child: isLoading == true
        ? Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: circularColor ?? Colors.white,
      ),
    )
        : Text(
      text,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    style: TextButton.styleFrom(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  );
}
