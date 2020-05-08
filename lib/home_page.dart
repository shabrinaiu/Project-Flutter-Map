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
      appBar: AppBar (
        title: Text ("TugasPakfahrul2"),
      ),
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
    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Tugaspakfahrul3"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[LocationTab(), ProfileTab(), HomeTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.location_on),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.home),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}