import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:mime/mime.dart';

imageUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([issvg = false]) async {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
    // You can filter based on the extension here, but by default, ImagePicker handles image types.
  );

  if (pickedFile != null) {
    File file = File(pickedFile.path);

    // Check MIME type to confirm it's a valid JPG image
    final mimeType = lookupMimeType(file.path);
    print("==================${mimeType}");
    if (mimeType == "image/jpeg") {
      return file;
    } else {
      Get.defaultDialog(
        titleStyle: TextStyle(
            color: AppColor.red, fontWeight: FontWeight.bold),
        title: "Warning",
        content: Text(
            'The selected file is not a valid JPG image. Please choose another one!'));
      return null; // or you can handle this case differently
    }
  } else {
    return null; // User canceled the picker
  }
}


