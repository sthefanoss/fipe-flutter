import 'package:sqflite/sqflite.dart';

abstract class DatabaseClient {
  factory DatabaseClient() => _SQLite();
  Future<dynamic> query(String query, [List arguments]);
}

class _SQLite implements DatabaseClient {
  Database _database;

  Future<Database> get _instance async {
    if (_database == null) {
      _database = await openDatabase('fipe_flutter.db', version: 1);
    }
    return _database;
  }

  Future<dynamic> query(String query, [List arguments]) async {
    return (await _instance).rawQuery(query, arguments);
  }
}
