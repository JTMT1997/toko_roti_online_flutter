import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE,
          password TEXT,
          name TEXT,
          role TEXT,
          status Text
        )
      ''');
    });
  }

  Future<int> registerUser(String email, String password, String name, String role) async {
    final dbClient = await db;
    return await dbClient.insert('users', {
      'email': email,
      'password': password,
      'name': name,
      'role': role,
    });
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final dbClient = await db;
    final result = await dbClient.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }


  Future<List<Map<String, dynamic>>> getAllUsers() async {
  final dbClient = await db;
  return await dbClient.query('users');
}


Future<int> updateUser(int id, String email, String password, String name, String role) async {
  final dbClient = await db;
  return await dbClient.update(
    'users',
    {
      'email': email,
      'password': password,
      'name': name,
      'role': role,

    },
    where: 'id = ?',
    whereArgs: [id],
  );
}
Future<int> deleteUser(int id) async {
  final dbClient = await db;
  return await dbClient.delete(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );
}

}