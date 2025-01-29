import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tafakkur_test/app/design_system/design_system.dart';

class CardWidget extends StatelessWidget {
  final Color? color;
  final String? asset;
  final String? galleryImage;
  final Gradient? gradient;
  final double blur;
  final String name;
  final String cardNumber;
  final String date;

  const CardWidget({
    super.key,
    this.color,
    this.asset,
    this.galleryImage,
    required this.gradient,
    required this.blur,
    required this.name,
    required this.cardNumber,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 0.7.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: color,
        image: asset != null
            ? DecorationImage(
                image: AssetImage(asset!),
                fit: BoxFit.cover,
              )
            : galleryImage != null
                ? DecorationImage(
                    image: FileImage(File(galleryImage!)),
                    fit: BoxFit.cover,
                  )
                : null,
        gradient: gradient,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    const SizedBox(),
                  ],
                ),
                SizedBox(height: 8.h),
                SizedBox(height: 8.h),
                const Spacer(),
                Text(cardNumber),
                SizedBox(height: 8.h),
                Text(date),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
