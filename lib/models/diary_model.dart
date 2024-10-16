import 'package:flutter/material.dart';
import 'package:nutripic/objects/diary.dart';

class DiaryModel with ChangeNotifier {
  // List<Diary> diaries = [];
  Diary? diary;

  /// 선택된 다이어리 데이터 리셋
  void reset() {
    diary = null;
  }

  // 임시 dummy data
  Map<DateTime, List<Diary>> diaries = {
    DateTime.utc(2024, 10, 22): [
      Diary(diaryId: '1', content: '일'),
      Diary(diaryId: '2', content: '이'),
    ],
    DateTime.utc(2024, 10, 24): [Diary(diaryId: '3', content: '삼')],
  };
}
