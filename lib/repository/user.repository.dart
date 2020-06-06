import 'package:college_backoffice/definitions/user.model.dart';
import 'package:college_backoffice/repository/database.dart';

class UserRepository {
  DatabaseHelper _databaseHelper;

  UserRepository(){
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<User>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "Users",
      columns: [
        "id",
        "name",
        "type",
      ]
    );

    List<User> itens = new List<User>();
    for (Map i in result) {
      itens.add(User.fromMap(i));
    }

    return itens;
  }

  Future<int> create(User item) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "Users",
      item.toMap(),
    );

    return result;
  }

  Future<List<User>> findByCourseId(String id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM User WHERE coursesIds LIKE '%$id%'";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      List<User> users;
      results.forEach((element) { 
        users.add(User.fromMap(element));
      });

      return users;
    } else {
      return null;
    }
  }

  Future<int> add(User user) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO Users" +
        "VALUES ( " +
        "    '${user.id}' , " +
        "    '${user.name}' , " +
        "     ${user.type}, " +
        "     ${user.type}, " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<User> findById(String id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM CursoModel WHERE ID = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new User.fromMap(results.first);
    } else {
      return null;
    }
  }
}
