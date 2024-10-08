import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nutripic/components/custom_app_bar.dart';
import 'package:nutripic/view_models/diary/diary_camera_view_model.dart';
import 'package:nutripic/view_models/diary/diary_view_model.dart';
import 'package:nutripic/views/diary/diary_camera_view.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  @override
  Widget build(BuildContext context) {
    DiaryViewModel diaryViewModel = context.watch<DiaryViewModel>();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: '식단 일기'),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2024, 1, 1),
            lastDay: DateTime(2025, 12, 31),
            selectedDayPredicate: (day) {
              return diaryViewModel.isSameDay(day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              diaryViewModel.updateSelectDay(selectedDay);
              diaryViewModel.showDiaryRecordModal(context, selectedDay);
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              todayDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              selectedTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              markerSize: 7.0,
              markersAnchor: 1.0,
              markerMargin: const EdgeInsets.only(
                left: 2.0,
                top: 10.0,
                right: 2.0,
                bottom: 10.0,
              ),
              markerDecoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: diaryViewModel.getDiariesForDay,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          diaryViewModel.showCameraSelectModal(context);
        },
      ),
    );
  }
}
