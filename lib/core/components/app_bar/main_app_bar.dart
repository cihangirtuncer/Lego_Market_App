import 'package:flutter/material.dart';
import 'package:lego_market_app/core/widget/color.dart';

// ignore: non_constant_identifier_names
BuildAppBar(String name, bool whichTF) {
  return AppBar(
    automaticallyImplyLeading: whichTF,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFFB60707),
            Color(0xFFE49E07),
          ],
        ),
      ),
    ),
    title: Center(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 23,
        ),
      ),
    ),
  );
}
