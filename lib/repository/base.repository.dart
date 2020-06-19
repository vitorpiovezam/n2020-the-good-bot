import 'package:n2020_the_good_bot/repository/database.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseRepository {
  DatabaseHelper _databaseHelper;

  BaseRepository() {
    _databaseHelper = new DatabaseHelper();
  }
}
