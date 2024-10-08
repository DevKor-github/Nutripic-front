import 'package:flutter/material.dart';
import 'package:nutripic/utils/app_router.dart';
import 'package:nutripic/view_models/diary/diary_record_view_model.dart';
import 'package:provider/provider.dart';

class DiaryRecordView extends StatelessWidget {
  const DiaryRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    DiaryRecordViewModel diaryRecordViewModel =
        context.watch<DiaryRecordViewModel>();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: diaryRecordViewModel.diaryRecords.length,
        itemBuilder: (context, index) {
          final record = diaryRecordViewModel.diaryRecords[index];
          return ListTile(
            title: Text(record.content!),
          );
        },
      ),
    );
  }
}
