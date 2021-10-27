import 'package:flutter/material.dart';
import '../../widget/gradient_container.dart';
import '../../widget/main_appBar.dart';

buildProductsScaffold(String productName, ListView listView) {
  return Scaffold(
    appBar: MainAppBar(
        Text(
          productName,
        ),
        true),
    body: buildGradientContainer(
      listView,
    ),
  );
}
