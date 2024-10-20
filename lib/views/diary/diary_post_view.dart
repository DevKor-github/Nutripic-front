import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nutripic/components/custom_app_bar.dart';
import 'package:nutripic/view_models/diary/diary_post_view_model.dart';
import 'package:provider/provider.dart';

class DiaryPostView extends StatefulWidget {
  const DiaryPostView({super.key});

  @override
  State<DiaryPostView> createState() => _DiaryPostViewState();
}

class _DiaryPostViewState extends State<DiaryPostView> {
  @override
  Widget build(BuildContext context) {
    DiaryPostViewModel diaryPostViewModel = context.watch<DiaryPostViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(title: '새로운 게시물'),

            // 사진
            GestureDetector(
              onTap: () => diaryPostViewModel.showCameraSelectModal(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(diaryPostViewModel.diaryModel.diary!.imageUrl!),
                  height: 250,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 날짜
            GestureDetector(
              onTap: () => diaryPostViewModel.onTapTimePicker(),
              child: Text(
                diaryPostViewModel.selectedDateString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 게시글
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: '게시글을 작성하세요',
                  hintStyle: const TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // 키보드 설정
                textInputAction: TextInputAction.done,
              ),
            ),

            // 게시 버튼
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => diaryPostViewModel.submitPost(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('게시', style: TextStyle(fontSize: 15)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
