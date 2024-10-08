import 'package:flutter/material.dart';
import 'package:nutripic/models/diary_model.dart';
import 'package:nutripic/view_models/diary/diary_camera_view_model.dart';
import 'package:nutripic/view_models/diary/diary_record_view_model.dart';
import 'package:nutripic/views/diary/diary_camera_view.dart';
import 'package:nutripic/views/diary/diary_record_view.dart';
import 'package:provider/provider.dart';

class DiaryViewModel extends ChangeNotifier {
  DateTime? selectedDate;

  //DiaryModel diaryModel;
  //BuildContext context;
  //DiaryViewModel({required this.diaryModel, required this.context});
  //Map<DateTime, List<DiaryModel>> _diarylist = {};
  final Map<DateTime, List<Diary>> diarylist = {
    DateTime.utc(2024, 10, 22): [
      Diary(diaryId: '1', content: '일'),
      Diary(diaryId: '2', content: '이'),
    ],
    DateTime.utc(2024, 10, 24): [Diary(diaryId: '3', content: '삼')],
  };

  //날짜 선택 후 selectedDate 업데이트
  ///선택한 날짜 업데이트
  void updateSelectDay(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  //table_calender에서 선택된 날짜를 표시하기 위해 검사용
  ///선택한 날짜와 동일한지 확인
  bool isSameDay(DateTime date) {
    return selectedDate == date;
  }

  ///선택된 날짜의 일기 불러오기
  List<Diary> getDiariesForDay(DateTime date) {
    return diarylist[date] ?? [];
  }

  ///카메라/갤러리 선택 모달 보여주기
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

  ///일기 목록 모달 보여주기
  void showDiaryRecordModal(BuildContext context, DateTime date) {
    final diaryRecords = getDiariesForDay(date);
    if (diaryRecords.isEmpty) return;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) => DiaryRecordViewModel(diaryRecords),
          child: const DiaryRecordView(),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    );
  }
}
