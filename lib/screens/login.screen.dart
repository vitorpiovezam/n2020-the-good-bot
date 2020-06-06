import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool selected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(39.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 130.0,
                      child: Image.network(
                        'https://media.glassdoor.com/sqll/1149004/fiap-squarelogo-1576755200976.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 35.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: borderRadius,
                      color: Colors.blue,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/home_screen');
                        },
                        child: Text("Login",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.0, -0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
BorderRadius borderRadius = BorderRadius.circular(5);
final rmController = TextEditingController();
final passwordController = TextEditingController();

final emailField = TextField(
  obscureText: false,
  style: style,
  controller: rmController,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "User or RM",
      border: OutlineInputBorder(borderRadius: borderRadius)),
);

final passwordField = TextField(
  obscureText: true,
  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "Password",
      border: OutlineInputBorder(borderRadius: borderRadius)),
);
