import 'package:n2020_the_good_bot/definitions/complaint.model.dart';
import 'package:n2020_the_good_bot/repository/database.dart';

class ComplaintRepository{
  DatabaseHelper _databaseHelper;

  ComplaintRepository() {
    _databaseHelper = new DatabaseHelper();
  } 

  Future<List<Complaint>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "Complaints",
      columns: [
        "id",
        "type",
        "description",
        "address",
      ],
    );

    List<Complaint> complaints = new List<Complaint>();
    for (Map i in result) {
      complaints.add(Complaint.fromMap(i));
    }

    return complaints;
  }

  Future<int> create(Complaint complaint) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "Complaint",
      complaint.toMap(),
    );

    return result;
  }

  Future<int> add(Complaint complaint) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO Complaints" +
        "VALUES ( " +
        "    '${complaint.id}' , " +
        "    '${complaint.type}' , " +
        "     ${complaint.description}, " +
        "     ${complaint.address}, " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

}
