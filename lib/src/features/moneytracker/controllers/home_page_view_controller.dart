import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CalendarController extends GetxController {
  Rx<DateTime> _currentMonth = DateTime.now().obs;

  DateTime get currentMonth => _currentMonth.value;

  void moveToPreviousMonth() {
    _currentMonth.value = DateTime(
      _currentMonth.value.year,
      _currentMonth.value.month - 1,
    );
  }

  void moveToNextMonth() {
    _currentMonth.value = DateTime(
      _currentMonth.value.year,
      _currentMonth.value.month + 1,
    );
  }
}


