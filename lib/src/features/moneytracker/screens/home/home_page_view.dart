import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import '../../controllers/home_page_view_controller.dart';

class HomePageView extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Iconsax.arrow_left_3,),
              onPressed: () => controller.moveToPreviousMonth(),
            ),
            Obx(
              () => Text(
                DateFormat('MMMM yyyy').format(controller.currentMonth),
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              icon: Icon(
                Iconsax.arrow_right_2,
              ),
              onPressed: () => controller.moveToNextMonth(),
            ),
          ],
        ),
        Obx(
          ()=> Container(
            child: Text(
              DateFormat('MMMM yyyy').format(controller.currentMonth),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
