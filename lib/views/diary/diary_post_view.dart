import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutripic/components/custom_app_bar.dart';
import 'package:nutripic/view_models/diary/diary_post_view_model.dart';
import 'package:provider/provider.dart';

class DiaryPostView extends StatefulWidget {
  final String imagePath;
  const DiaryPostView({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<DiaryPostView> createState() => _DiaryPostViewState();
}

class _DiaryPostViewState extends State<DiaryPostView> {
  @override
  Widget build(BuildContext context) {
    DiaryPostViewModel diaryPostViewModel = context.watch<DiaryPostViewModel>();
    DateTime selectedDate = diaryPostViewModel.selectedDate;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(title: '새로운 게시물'),
            GestureDetector(
              onTap: () {
                diaryPostViewModel.showCameraSelectModal(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.file(
                  File(widget.imagePath),
                  height: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                diaryPostViewModel.onTapTimePicker(context);
              },
              child: Text(
                '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: '게시글을 작성하세요',
                  hintStyle: const TextStyle(
                    fontSize: 15.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                //키보드 설정
                textInputAction: TextInputAction.done,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    diaryPostViewModel.submitPost(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "게시",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
