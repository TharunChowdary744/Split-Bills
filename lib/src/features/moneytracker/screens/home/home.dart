import 'package:bill_split/src/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:bill_split/src/features/moneytracker/screens/home/home_page_view.dart';
import 'package:bill_split/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: HomePageView(),
            )
          ],
        ),
      ),
    );
  }
}
