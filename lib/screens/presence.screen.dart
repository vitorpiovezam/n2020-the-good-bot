import 'package:college_backoffice/definitions/class.model.dart';
import 'package:college_backoffice/service/classes.service.dart';
import 'package:flutter/material.dart';

import 'chamada.screen.dart';

class PresenceScreen extends StatefulWidget {
  @override
  _PresenceScreenState createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Selecione a Aula"),
      ),
      body: FutureBuilder<List>(
        //future: cursoRepository.findAll(),
        future: new ClassService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            String erroMessage = snapshot.error.toString();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Erro ao carregar a lista de Aulas. \n Detalhes: $erroMessage'),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length > 0) {
                return buildGridView(snapshot.data);
              } else {
                return Center(
                  child: Text("Nenhuma aula cadastrada!"),
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


GridView buildGridView(List<Class> itens) {
  return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 0,
      childAspectRatio: 3,
      children: itens.map((value) {
        return FlatButton(
          color: Colors.blue,
          padding: EdgeInsets.all(10),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChamadaScreen(courseId: value.id),
              ),
            );
          },
          child: Text(
            value.name + "horario: " + value.date + " das " + value.initHour + " as " + value.endHour,
            style: TextStyle(fontSize: 12.0),
          ),
        );
      }).toList(),
    );
  }
}
