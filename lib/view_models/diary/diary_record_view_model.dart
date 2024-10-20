import 'package:flutter/material.dart';
import 'package:nutripic/objects/diary.dart';

class DiaryRecordViewModel extends ChangeNotifier {
  final List<Diary> diaryRecords;
  DiaryRecordViewModel(this.diaryRecords);
}
