import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';
class TcPrimaryHeaderContainer extends StatelessWidget {
  const TcPrimaryHeaderContainer({
    super.key,
    required this.child
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TcCurvedEdgeWidget(
      child: Container(
        color: TcColors.primary,
        // padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: TcCircularContainer(
                  backgroundColor: TcColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
              top: 100,
              right: -300,
              child: TcCircularContainer(
                backgroundColor: TcColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
