import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class DiaryCameraViewModel extends ChangeNotifier {
  File? image;
  final ImagePicker _picker = ImagePicker();

  /// 이미지 선택 함수 (카메라/갤러리)
  Future<void> getImage(ImageSource source, BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();

      //이미지가 선택된 경우 이동
      closeCameraSelectModal(context);
      context.go('/diary/post', extra: image!.path);
    }
  }

  void closeCameraSelectModal(BuildContext context) {
    Navigator.pop(context);
    notifyListeners();
  }
}
