import 'package:college_backoffice/repository/database.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseRepository {
  DatabaseHelper _databaseHelper;

  BaseRepository() {
    _databaseHelper = new DatabaseHelper();
  }
}
