import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

/// 카메라, 갤러리 중 선택하는 모달
///
/// ImageSource를 반환
Future<ImageSource?> selectCameraModal(BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  '올리기',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close, size: 33),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  // 카메라 선택
                  onTap: () => context.pop(ImageSource.camera),
                  child: const Column(
                    children: [
                      Icon(Icons.camera_alt, size: 50),
                      Text('카메라', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                InkWell(
                  // 갤러리 선택
                  onTap: () => context.pop(ImageSource.gallery),
                  child: const Column(
                    children: [
                      Icon(Icons.photo_library, size: 50),
                      Text(
                        '갤러리',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
  );
}
