import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/home_page/product_list.dart';
import 'package:lego_market_app/core/constant/scaffold/products_scaffold.dart';
import 'package:lego_market_app/models/foods.dart';
import 'package:lego_market_app/utils/dbhelper.dart';

class SexualHealthList extends StatefulWidget {
  @override
  _SexualHealthListState createState() => _SexualHealthListState();
}

class _SexualHealthListState extends State<SexualHealthList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.foodsFetch("SexualHealth").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "SEXUAL HEALTH",
      ListView(
        children: foodItemCreat(),
      ),
    );
  }

  List<Column> foodItemCreat() {
    return allFoodList
        .map(
          (product) => BuildProductList(
            context,
            product.name,
            product.explanation,
            product.price,
          ),
        )
        .toList();
  }
}
