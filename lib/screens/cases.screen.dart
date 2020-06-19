import 'package:n2020_the_good_bot/definitions/case.model.dart';
import 'package:n2020_the_good_bot/service/cases.service.dart';
import 'package:flutter/material.dart';

class CasesScreen extends StatefulWidget {
  @override
  _CasesScreenState createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Numero de casos"),
      ),
      body: FutureBuilder<List>(
        //future: cursoRepository.findAll(),
        future: new CasesService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            String erroMessage = snapshot.error.toString();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'Erro ao carregar os casos. \n Detalhes: $erroMessage'),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length > 0) {
                return buildGridView(snapshot.data);
              } else {
                return Center(
                  child: Text("Nenhum caso de covid <3"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
BorderRadius borderRadius = BorderRadius.circular(5);
final rmController = TextEditingController();
final passwordController = TextEditingController();


GridView buildGridView(List<Case> itens) {
  return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 3.0,
      childAspectRatio: 3,
      children: itens.map((value) {
        return FlatButton(
          color: Colors.blue,
          padding: EdgeInsets.all(10.0),
          onPressed: () async {
          },
          child: Text(
            (value.location + "\n" + value.infected),
            style: TextStyle(fontSize: 15.0),
          ),
        );
      }).toList(),
    );
  }
}
