import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:maptravo/notification_tab.dart';
import 'package:maptravo/location_tab.dart';
import 'package:maptravo/profile_tab.dart';

class NavBar extends StatelessWidget {
  static String tag = 'Navbar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
    ); 
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[LocationTab(), ProfileTab(), NotificationTab()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.location_on),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.notifications),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}