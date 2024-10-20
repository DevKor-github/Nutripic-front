import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutripic/components/custom_date_picker.dart';
import 'package:nutripic/components/select_camera_modal.dart';
import 'package:nutripic/models/diary_model.dart';

class DiaryPostViewModel with ChangeNotifier {
  DiaryModel diaryModel;
  BuildContext context;
  DiaryPostViewModel({required this.diaryModel, required this.context});

  final ImagePicker _picker = ImagePicker();
  DateTime selectedDate = DateTime.now();

  /// 카메라/갤러리 선택 모달
  void showCameraSelectModal() async {
    // 모달 띄워서 사진 업로드 방식 선택 (카메라, 갤러리)
    final mode = await selectCameraModal(context);

    // 선택된
    if (mode != null) {
      // 이미지 촬영 / 갤러리에서 이미지 불러오기
      final pickedFile = await _picker.pickImage(source: mode);

      // 사진 촬영 완료 후 diary에 사진 경로 업데이트
      // TODO: 기존 경로에 있는 사진을 제거하는 로직 추가 필요
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        diaryModel.diary!.imageUrl = image.path;
        notifyListeners();
      }
    }
  }

  /// 날짜 선택 모달 이동
  void onTapTimePicker() async {
    selectedDate = await showCustomDatePicker(context, selectedDate);
    notifyListeners();
  }

  /// 선택된 날짜를 String 형식으로 반환하는 함수
  // 날짜 형식 변환 관련 함수는 아마 나중에 utils에 따로 만들지 않을까 싶긴 합니다.
  String selectedDateString() {
    return '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일';
  }

  /// 게시물 전송
  void submitPost() {
    context.pop();
  }
}
