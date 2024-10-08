import 'package:flutter/material.dart';
import 'package:nutripic/models/diary_model.dart';

class DiaryRecordViewModel extends ChangeNotifier {
  final List<Diary> diaryRecords;
  DiaryRecordViewModel(this.diaryRecords);
}
