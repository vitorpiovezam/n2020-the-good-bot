import 'package:flutter/material.dart';

class NewComplaintScreen extends StatefulWidget {
  @override
  _NewComplaintScreenState createState() => _NewComplaintScreenState();
}

class _NewComplaintScreenState extends State<NewComplaintScreen> {
  bool selected = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String teste = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Denuncia"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(height: 20.0),
                    new TextFormField(
                      decoration: const InputDecoration(labelText: 'Tipo (denuncia/aglomeracao)'),
                      keyboardType: TextInputType.text,
                      validator: (String arg) {
                        if (arg.length < 5)
                          return 'Deve ter mais de 5 caracteres';
                        else
                          return null;
                      },
                      onSaved: (String val) {
                        teste = val;
                      },
                    ),
                    SizedBox(height: 25.0),
                    new TextFormField(
                      decoration: const InputDecoration(labelText: 'Descrição'),
                      keyboardType: TextInputType.text,
                      validator: (String arg) {
                        if (arg.length < 10)
                          return 'Deve ter mais de 10 caracteres';
                        else
                          return null;
                      },
                      onSaved: (String val) {
                        print(val);
                      },
                    ),
                    SizedBox(height: 25.0),
                    new TextFormField(
                      decoration: const InputDecoration(labelText: 'Endereco'),
                      keyboardType: TextInputType.text,
                      validator: (String arg) {
                        if (arg.length < 10)
                          return 'Deve ter mais de 10 caracteres';
                        else
                          return null;
                      },
                      onSaved: (String val) {
                        print(val);
                      },
                    ),
                    SizedBox(height: 35.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: borderRadius,
                      color: Colors.blue,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            showSucessDialog(context);
                          }
                        },
                        child: Text("Cadastrar denuncia",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: borderRadius,
                      color: Colors.blue,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/complaint-list');
                        },
                        child: Text("Ver minhas denuncias cadastradas",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
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



showSucessDialog(BuildContext context) { 
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { 
      Navigator.of(context).pop();
    },
  );
  AlertDialog alerta = AlertDialog(
    title: Text("Cadastrado com sucesso"),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}


TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
BorderRadius borderRadius = BorderRadius.circular(5);
