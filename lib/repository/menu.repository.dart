import 'dart:convert';
import 'package:college_backoffice/repository/database.dart';

class MenuItem{
  String id;
  String label;
  String screenpath;

  MenuItem({
    this.id,
    this.label,
    this.screenpath
  });

  factory MenuItem.fromJson(String str) => MenuItem.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

    factory MenuItem.fromMap(Map<String, dynamic> json) => MenuItem(
        id: json["id"],
        label: json["label"],
        screenpath: json["screenpath"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "label": label,
        "screenPath": screenpath,
    };
}

class MenuRepository {
  DatabaseHelper _databaseHelper;

  MenuRepository(){
    _databaseHelper = new DatabaseHelper();

    create(new MenuItem(id: '1', label: 'logoff', screenpath: '/'));
    create(new MenuItem(id: '2', label: 'presença', screenpath: '/presence'));
    create(new MenuItem(id: '3', label: 'correção de prova', screenpath: '/tests-review'));
    create(new MenuItem(id: '4', label: 'considerações', screenpath: '/about'));
  }

  Future<List<MenuItem>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "MenuItems",
      columns: [
        "id",
        "label",
        "screenpath",
      ],
    );

    List<MenuItem> menuItems = new List<MenuItem>();
    for (Map i in result) {
      menuItems.add(MenuItem.fromMap(i));
    }

    return menuItems;
  }

  Future<int> create(MenuItem menuItem) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "MenuItems",
      menuItem.toMap(),
    );

    return result;
  }

  Future<int> add(MenuItem menuItem) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO MenuItems" +
        "VALUES ( " +
        "    '${menuItem.id}' , " +
        "    '${menuItem.label}' , " +
        "     ${menuItem.screenpath}, " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

}
