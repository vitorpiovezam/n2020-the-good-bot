import 'package:college_backoffice/definitions/user.model.dart';
import 'package:college_backoffice/repository/user.repository.dart';
import 'package:flutter/material.dart';

class ChamadaScreen extends StatefulWidget {
  final String courseId;

  ChamadaScreen({Key key, @required this.courseId}) : super(key: key);
  @override
  _ChamadaScreenState createState() => _ChamadaScreenState();

}


class _ChamadaScreenState extends State<ChamadaScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserRepository _userRepository = UserRepository();
  List<String> missingStudents;

  String get courseId => courseId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text(courseId),
      ),
      body: FutureBuilder<List>(
        //future: cursoRepository.findAll(),
        future: _userRepository.findByCourseId(this.courseId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            String erroMessage = snapshot.error.toString();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Erro ao carregar a lista de cursos. \n Detalhes: $erroMessage'),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length > 0) {
                return buildListView(snapshot.data);
              } else {
                return Center(
                  child: Text("Nenhum curso cadastrado!"),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        child: Icon(Icons.add),
        onPressed: () async {
          var retorno = await Navigator.pushNamed(context, "/cursos_novo");

          if (retorno != null) {
            setState(() {});

            scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(retorno),
              ),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<User> users) {
    return ListView.builder(
      itemCount: users == null ? 0 : users.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          key: Key(users[index].id.toString()),
          child : (
            Text("faltou")
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            print(direction);
            missingStudents.add(users[index].id);
            setState(() {});
          },
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}