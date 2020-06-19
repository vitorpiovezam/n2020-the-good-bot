import 'package:n2020_the_good_bot/repository/menu.repository.dart';
import 'package:n2020_the_good_bot/service/menu.service.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          opacity: 0,
        ),
        backgroundColor: Colors.blue,
        title: Text("Menu"),
      ),
      body: FutureBuilder<List>(
        //future: cursoRepository.findAll(),
        future: new MenuService().getMenuItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            String erroMessage = snapshot.error.toString();
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'Erro ao carregar o menu. \n Detalhes: $erroMessage'),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length > 0) {
                return buildGridView(snapshot.data);
              } else {
                return Center(
                  child: Text("Nenhum item cadastrado no menu"),
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


GridView buildGridView(List<MenuItem> itens) {
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
            await Navigator.pushNamed(context, value.screenpath);
          },
          child: Text(
            value.label,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }).toList(),
    );
  }
}
