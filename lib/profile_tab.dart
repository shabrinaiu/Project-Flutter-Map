import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ProfileTabs(title: 'Profile'),
    );
  }
}

class ProfileTabs extends StatefulWidget {
  ProfileTabs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTabs> {

  @override
  Widget build(BuildContext context) {
    
    final foto = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/logo.jpg'),
        ),
      ),
    );

    final namalengkap = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Mas Fanus',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final kelas = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '2d3ITA',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(58, 66, 86, 1.0),
          Color.fromRGBO(58, 66, 86, 1.0),
        ]),
      ),
      child: Column(
        children: <Widget>[foto, namalengkap, kelas],
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: body,
    );
  }
}
