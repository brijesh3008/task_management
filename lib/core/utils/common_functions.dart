import 'package:task_management/core/app_extensions/replace_html_tags_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


String networkText(String text) {
  return text.replaceHtmlTags();
}

Future<DateTime> selectDate(BuildContext context, DateTime initialDate) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate,
    initialDatePickerMode: DatePickerMode.day,
    firstDate: DateTime.now(),
    lastDate:
        DateTime(initialDate.year, initialDate.month, initialDate.day + 6),
  );

  if (picked != null) {
    return picked;
  }

  return DateTime.now();
}

bool isSlot(String transStatus) {
  return (transStatus != 'DL' &&
      transStatus != 'DELIVERED' &&
      transStatus != 'CANCEL' &&
      transStatus != 'RETURN_REQUEST' &&
      transStatus != 'ACCEPT_RETURN_REQUEST' &&
      transStatus != 'RETURN_IN_TRANSIT');
}

String formatDateDMMMY(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('d MMM y').format(date);
  } catch (e) {
    return '';
  }
}

