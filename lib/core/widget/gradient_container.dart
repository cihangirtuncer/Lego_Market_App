import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BuildGradientContainer(Widget widget) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xF541012C),
          Color(0xF504094E),
          Color(0xFF040C7C),
          Colors.teal,
          Color(0xFFE49E07),
          Color(0xFFE43307),
          Color(0xFF8D0505),
        ],
      ),
    ),
    child: widget,
  );
}
