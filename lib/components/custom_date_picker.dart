import 'package:flutter/cupertino.dart';
import 'package:nutripic/components/date_picker.dart';

Future<DateTime> showCustomDatePicker(
  BuildContext context,
  DateTime selectedDate,
) async {
  await showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return DatePicker(
        initialDate: selectedDate,
        onDateSelected: (DateTime date) {
          selectedDate = date;
        },
      );
    },
  );

  return selectedDate;
}
