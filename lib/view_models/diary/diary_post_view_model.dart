import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutripic/components/date_picker.dart';
import 'package:nutripic/view_models/diary/diary_camera_view_model.dart';
import 'package:nutripic/views/diary/diary_camera_view.dart';
import 'package:provider/provider.dart';

class DiaryPostViewModel with ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  /// 카메라/갤러리 선택 모달 이동 (재사용이긴함)
  void showCameraSelectModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => DiaryCameraViewModel(),
          child: const DiaryCameraView(),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    );
  }

  /// 날짜 선택 모달 이동
  void onTapTimePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return DatePicker(
            initialDate: selectedDate,
            onDateSelected: (DateTime date) {
              selectedDate = date;
              notifyListeners();
            },
          );
        });
  }

  ///게시물 전송
  void submitPost(BuildContext context) {
    context.go('/diary');
  }
}
