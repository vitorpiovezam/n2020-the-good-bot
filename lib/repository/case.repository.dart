import 'package:n2020_the_good_bot/definitions/case.model.dart';
import 'package:n2020_the_good_bot/repository/database.dart';

class CasesRepository{
  DatabaseHelper _databaseHelper;

  CasesRepository() {
    _databaseHelper = new DatabaseHelper();
  } 

  Future<List<Case>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "CovidCases",
      columns: [
        "id",
        "country",
        "location",
        "infected",
      ],
    );

    List<Case> cases = new List<Case>();
    for (Map i in result) {
      cases.add(Case.fromMap(i));
    }

    return cases;
  }

  Future<int> create(Case item) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "CovidCases",
      item.toMap(),
    );

    return result;
  }

  Future<int> add(Case item) async { 
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO CovidCases" +
        "VALUES ( " +
        "    '${item.id}' , " +
        "    '${item.country}' , " +
        "     ${item.location}, " +
        "     ${item.infected}, " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

}
