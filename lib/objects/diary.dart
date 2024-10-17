class Diary {
  /// 게시물 아이디
  String? diaryId;

  /// 게시 날짜
  DateTime? date;

  /// 게시물 본문
  String? content;

  /// 게시물 사진 Url
  String? imageUrl;

  Diary({
    this.date,
    this.diaryId,
    this.content,
    this.imageUrl,
  });

  @override
  String toString() {
    return 'diaryId: $diaryId '
        'date: $date '
        'content: $content '
        'imageUrl: $imageUrl';
  }
}
