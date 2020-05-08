import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:maptravo/home_tab.dart';
import 'package:maptravo/location_tab.dart';
import 'package:maptravo/profile_tab.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(),
    ); 
  }
}


class BottomNavyBar extends StatefulWidget {
  @override
  BottomNavyBarState createState() => BottomNavyBarState();
  
}

class BottomNavyBarState extends State<BottomNavyBar> with SingleTickerProviderStateMixin {
 // Create a tab controller
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
        children: <Widget>[LocationTab(), ProfileTab(), HomeTab()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.location_on),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.home),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}