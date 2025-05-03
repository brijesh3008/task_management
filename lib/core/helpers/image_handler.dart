import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageHandler {
  final ImagePicker _imagePicker = ImagePicker();

  static String? getImageType(String? imagePath) {
    if (imagePath == null) {
      return null;
    }
    return imagePath.split('.').last;
  }

  Future<XFile?> getImage(ImageSource source) async {
    final XFile? image = await _imagePicker.pickImage(source: source);
    return image;
  }

  static Future<XFile> getImageFromUrl(String url) async {
    final Response response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));

    final Directory temp = await getTemporaryDirectory();
    final File imageFile = File('${temp.path}.png');
    imageFile.writeAsBytesSync(response.data);

    return XFile(imageFile.path);
  }

  static Future<String?> convertImageToBase64(XFile? imagePath) async {
    if (imagePath == null) {
      return null;
    }
    final Uint8List imageBytes = await imagePath.readAsBytes();
    return base64Encode(imageBytes);
  }
}
