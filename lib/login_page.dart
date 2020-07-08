import 'package:flutter/material.dart';
import 'package:maptravo/navbar.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'pak_tukang',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 48.0,
        child: new Image.asset('assets/pak_tukang-02.png'),
      ),
    );

    final email = TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'fanus@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final password = TextFormField(
      style: TextStyle(color: Colors.white),
      autofocus: false,
      initialValue: 'password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );

    final loginButton = FlatButton(
      color: Color(0xFF80E1D1),
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      onPressed: () {
        Navigator.of(context).pushNamed(NavBar.tag);
      },
      child: Text(
        "Login",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot Password',
        style: TextStyle(color: Colors.grey),
      ),
      onPressed: () {},
    );

    final loginLabel = Text(
        'Forgot Password',
        style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold
        ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            loginLabel,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}