import 'package:flutter/material.dart';
import '../../../core/widget/product_map_list.dart';
import '../../model/products.dart';
import '../../../utils/dbhelper.dart';

import '../../../../core/components/scaffold/products_scaffold.dart';

class SnacksList extends StatefulWidget {
  SnacksList({Key? key}) : super(key: key);

  @override
  _SnacksListState createState() => _SnacksListState();
}

class _SnacksListState extends State<SnacksList> {
  late DatabaseHelper databaseHelper;
  late List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>.empty(growable: true);
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Snacks").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "SNACKS",
      ListView(
        physics: BouncingScrollPhysics(),
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}
