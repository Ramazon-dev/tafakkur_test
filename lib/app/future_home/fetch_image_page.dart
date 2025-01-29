import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tafakkur_test/app/design_system/design_system.dart';

class FetchImagePage extends StatefulWidget {
  const FetchImagePage({super.key});

  @override
  State<FetchImagePage> createState() => _FetchImagePageState();
}

class _FetchImagePageState extends State<FetchImagePage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150.h,
              width: 150.r,
              decoration: BoxDecoration(
                image: _image != null ? DecorationImage(
                  image: FileImage(_image!),
                ) : null,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Upload photo for post here',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            PrimaryButton(
              text: 'Select from phone',
              onPressed: () async {
                await _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        File? img = File(image.path);
        img = await cropImage(img);
        setState(() {
          _image = img;
        });
      }
    } on PlatformException catch (e) {
      debugPrint('eeeeeeeeeeeerror $e');
      Navigator.pop(context);
    }
  }

  Future<File?> cropImage(File imageFile) async {
    final CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'card background image',
          toolbarColor: Colors.white,
          hideBottomControls: true,
          showCropGrid: true,
          statusBarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.ratio3x2,
          lockAspectRatio: true,
          activeControlsWidgetColor: Colors.white,
          cropFrameColor: Colors.white,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );
    if (croppedImage == null) return imageFile;
    return File(croppedImage.path);
  }
}
