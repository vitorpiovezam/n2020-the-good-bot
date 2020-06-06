import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static Database _database;

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get connection async {
    if (_database == null) {
      _database = await _createDatabase();
    }
    return _database;
  }

  Future<Database> _createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'college');

    var database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    String script = '''
    CREATE TABLE MenuItems (
      id TEXT PRIMARY KEY NOT NULL,
      label TEXT,
      screenpath TEXT
    );

    CREATE TABLE Course (
      id TEXT PRIMARY KEY NOT NULL,
      name TEXT,
      studentsIds TEXT
    );

    CREATE TABLE Users (
      id TEXT PRIMARY KEY NOT NULL,
      label TEXT,
      screenpath TEXT,
      coursesIds TEXT
    );

    CREATE TABLE Classes (
      id TEXT PRIMARY KEY NOT NULL,
      name TEXT,
      courseId TEXT,
      atendeesIds TEXT,
      date TEXT,
      initHour TEXT,
      endHour TEXT
    );

    INSERT into Course VALUES('1', 'redes', '1,3,4');
    INSERT into Course VALUES('2', 'xamarin', '3,4');
    INSERT into Course VALUES('3', 'engenharia', '1,2');
    INSERT into Course VALUES('4', 'big data', '1,4,3,2');

    INSERT into Classes VALUES('1', 'Aula 01', '1', '', '20/07/2020', '13:30', '14:50');
    INSERT into Classes VALUES('2', 'Aula 01', '2','', '20/07/2020', '14:50', '16:50');
    INSERT into Classes VALUES('3', 'Aula 02', '3','' ,'21/07/2020', '14:50', '16:50');
    INSERT into Classes VALUES('4', 'Aula 03', '3','', '22/07/2020', '14:50', '16:50');
    INSERT into Classes VALUES('5', 'Aula 01', '4','', '22/07/2020', '18:50', '19:50');

    ''';
    await database.execute(script);
  }
}
