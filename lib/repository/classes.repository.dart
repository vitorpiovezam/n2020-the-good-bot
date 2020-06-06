import 'package:college_backoffice/definitions/class.model.dart';
import 'package:college_backoffice/repository/base.repository.dart';
import 'package:college_backoffice/repository/database.dart';

class ClassesRepository extends BaseRepository {
  DatabaseHelper _databaseHelper;

  ClassesRepository() : super();

  Future<List<Class>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "Classes",
      columns: [
        "id"
        "name"
        "courseId"
        "atendeesIds"
        "date"
        "initHour"
        "endHour"
      ],
    );

    List<Class> itens = new List<Class>();
    for (Map i in result) {
      itens.add(Class.fromMap(i));
    }

    return itens;
  }

  Future<int> create(Class item) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "Classes",
      item.toMap(),
    );

    return result;
  }

  Future<int> add(Class item) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO Classes" +
        "VALUES ( " +
        "    '${item.id}' , " +
        "    '${item.name}' , " +
        "     ${item.courseId}, " +
        "     ${item.atendeesIds}, " +
        "     ${item.date}, " +
        "     ${item.initHour}, " +
        "     ${item.endHour}, " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

}
