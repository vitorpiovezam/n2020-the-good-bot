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
    if (_database != null)
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'college');
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
    await db.execute(
        '''
    CREATE TABLE MenuItems (
      id TEXT PRIMARY KEY NOT NULL,
      label TEXT,
      screenpath TEXT
    );
    ''');

    await db.execute(
        '''
    CREATE TABLE Complaints (
      id TEXT PRIMARY KEY NOT NULL,
      type TEXT,
      description TEXT,
      address TEXT
    );
    ''');

    await db.execute(
        '''
    CREATE TABLE CovidCases (
      id TEXT PRIMARY KEY NOT NULL,
      country TEXT,
      location TEXT,
      infected TEXT
    );
    ''');

    db.execute("INSERT INTO MenuItems VALUES('1', 'logoff', '/');");
    db.execute("INSERT INTO MenuItems VALUES('2', 'numero de casos', '/cases');");
    db.execute("INSERT INTO MenuItems VALUES('3', 'denuncia', '/complaint-new');");
    db.execute("INSERT INTO MenuItems VALUES('4', 'BOT de Assistencia', '/bot');");


    db.execute("INSERT INTO CovidCases VALUES('1', 'brazil', 'amazonas', '54.000');");
    db.execute("INSERT INTO CovidCases VALUES('2', 'brazil', 'roraima', '6.800');");
    db.execute("INSERT INTO CovidCases VALUES('3', 'brazil', 'pará', '69.000');");
    db.execute("INSERT INTO CovidCases VALUES('4', 'brazil', 'amapa', '16.500');");
    db.execute("INSERT INTO CovidCases VALUES('5', 'brazil', 'maranhao', '50.000');");
    db.execute("INSERT INTO CovidCases VALUES('6', 'brazil', 'piaui', '10.153');");
    db.execute("INSERT INTO CovidCases VALUES('7', 'brazil', 'ceara', '76.000');");
    db.execute("INSERT INTO CovidCases VALUES('8', 'brazil', 'rio grande do norte', '14.171');");
    db.execute("INSERT INTO CovidCases VALUES('9', 'brazil', 'paraiba', '28.000');");
    db.execute("INSERT INTO CovidCases VALUES('10', 'brazil', 'ceara', '45.261');");
    db.execute("INSERT INTO CovidCases VALUES('11', 'brazil', 'alagoas', '22.200');");
    db.execute("INSERT INTO CovidCases VALUES('12', 'brazil', 'sergipe', '13.000');");
    db.execute("INSERT INTO CovidCases VALUES('13', 'brazil', 'rondonia', '13.000');");
    db.execute("INSERT INTO CovidCases VALUES('14', 'brazil', 'acre', '11.000');");
    db.execute("INSERT INTO CovidCases VALUES('15', 'brazil', 'sao paulo', '178.000');");
    db.execute("INSERT INTO CovidCases VALUES('16', 'brazil', 'goias', '7.000');");
    db.execute("INSERT INTO CovidCases VALUES('17', 'brazil', 'espirito santo', '26.000');");
    db.execute("INSERT INTO CovidCases VALUES('18', 'brazil', 'rio de janeiro', '79.000');");
    db.execute("INSERT INTO CovidCases VALUES('19', 'brazil', 'mato grosso do sul', '3.400');");
    db.execute("INSERT INTO CovidCases VALUES('20', 'brazil', 'parana', '14.000');");
    db.execute("INSERT INTO CovidCases VALUES('21', 'brazil', 'santa catarina', '13.000');");
    db.execute("INSERT INTO CovidCases VALUES('22', 'brazil', 'rio grande do sul', '14. d600');");
  });
  }
}
