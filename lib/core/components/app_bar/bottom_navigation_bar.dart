import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lego_market_app/authenticate/auth_page/auth_type_selector.dart';
import 'package:lego_market_app/features/view/orders/null_user_order.dart';

import '../../../features/view/home/home_screen.dart';
import '../../../features/view/orders/orders_screen.dart';
import '../../../features/view/profile/profile_screen.dart';
//import '../../../features/view/search/search_screen.dart';
import '../icon/bottom_icon.dart';

class BottomHomePage extends StatefulWidget {
  @override
  _BottomHomePageState createState() => _BottomHomePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _BottomHomePageState extends State<BottomHomePage> {
  int _selectedIndex = 0;
  final tabs = [
    HomePage(),
    //Search(),
    _auth.currentUser == null ? NullUserOrders() : OrdersScreen(),
    _auth.currentUser == null ? AuthTypeSelector() : Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red.shade800,
        selectedIconTheme: IconThemeData(
          color: Colors.red.shade800,
        ),
        unselectedItemColor: Colors.grey.shade800,
        items: [
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.home,
            ),
            label: "HOME",
            backgroundColor: Colors.white,
          ),
          // BottomNavigationBarItem(
          //  icon: BuildBottomIcon(
          //    Icons.search,
          //  ),
          //  label: "SEARCH",
          //  backgroundColor: Colors.white,
          // ),
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.shopping_cart,
            ),
            label: "ORDERS",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: BuildBottomIcon(
              Icons.account_circle_rounded,
            ),
            label: "PROFILE",
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
      body: tabs[_selectedIndex],
    );
  }

  void onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
