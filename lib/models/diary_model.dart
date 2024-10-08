import 'package:flutter/material.dart';

class Diary {
  ///게시 날짜
  DateTime? date;

  ///게시물 아이디
  String? diaryId;

  ///게시물 본문
  String? content;

  ///게시물 사진 Url
  String? imageUrl;

  Diary({
    this.date,
    this.diaryId,
    this.content,
    this.imageUrl,
  });
}

class DiaryModel with ChangeNotifier {
  final List<Diary> _diaries = [];
  List<Diary> get diaries => _diaries;
}
