import 'package:flutter/material.dart';

final tcBorderRadius = BorderRadius.circular(7);

final tcInputBorderStyle = OutlineInputBorder(
  borderRadius: tcBorderRadius,
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.grey[300]!.withOpacity(0.5),
  ),
);