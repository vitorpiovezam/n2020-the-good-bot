import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool selected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("About"),
      ),
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
                    SizedBox(height: 35.0),
                    Text("pega leve ai professor, foram 7h de trabalho pra fazer essa nac (nacs tem tempo de apliacaçao de 2h maximo em condicoes normais)"),
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
