import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tafakkur_test/app/design_system/design_system.dart';

class CropPage extends StatelessWidget {
  final File image;

  const CropPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Image.file(image, height: 0.46182266.sh, fit: BoxFit.cover),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(20.r),
        child: PrimaryButton(
          text: 'Next',
          onPressed: () {
          },
        ),
      ),
    );
  }
}
