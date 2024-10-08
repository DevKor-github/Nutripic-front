import 'package:flutter/cupertino.dart';

class DatePicker extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePicker({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      color: CupertinoColors.systemBackground,
      child: Column(
        children: [
          Container(
            height: 180.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDate,
              onDateTimeChanged: onDateSelected,
            ),
          ),
          CupertinoButton(
            child: Text("확인"),
            onPressed: () {
              Navigator.pop(context); // 모달 닫기
            },
          ),
        ],
      ),
    );
  }
}
