import 'package:flutter/material.dart';
import 'package:maptravo/models/models.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'listProblems'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List listProblems;

  @override
  void initState() {
    listProblems = getlistProblems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(ListProblem listProblem) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.warning, color: Colors.white),
          ),
          title: Text(
            listProblem.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(listProblem.problem,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
        );

    Card makeCard(ListProblem listProblem) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(listProblem),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listProblems.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(listProblems[index]);
        },
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
      body: makeBody,
    );
  }
}

List getlistProblems() {
  return [
    ListProblem(
      title: "TRAFO0101",
      problem: "Perlu Diperbaiki",
    ),
    ListProblem(
      title: "TRAFO0222",
      problem: "Perlu Diperbaiki",
    ),
    ListProblem(
      title: "TRAFO0333",
      problem: "Sudah Diperbaiki",
    ),
  ];
}
