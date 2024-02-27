import 'package:flutter/material.dart';

import 'curved_edges.dart';
class TcCurvedEdgeWidget extends StatelessWidget {
  const TcCurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TcCustomCurvedEdges(),
      child: child,
    );
  }
}
