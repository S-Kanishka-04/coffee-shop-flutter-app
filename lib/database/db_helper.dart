import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "coffee.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE coffee(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL,
            quantity INTEGER,
            isFavorite INTEGER,
            inCart INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertCoffee(String name, double price, int qty,
      {bool fav = false, bool inCart = false}) async {
    final dbClient = await db;
    return await dbClient.insert("coffee", {
      "name": name,
      "price": price,
      "quantity": qty,
      "isFavorite": fav ? 1 : 0,
      "inCart": inCart ? 1 : 0,
    });
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final dbClient = await db;
    return await dbClient.query("coffee", where: "inCart = ?", whereArgs: [1]);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final dbClient = await db;
    return await dbClient.query("coffee", where: "isFavorite = ?", whereArgs: [1]);
  }

  Future<int> toggleFavorite(int id, bool fav) async {
    final dbClient = await db;
    return await dbClient.update("coffee", {"isFavorite": fav ? 1 : 0},
        where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteCartItem(int id) async {
    final dbClient = await db;
    return await dbClient.delete("coffee", where: "id = ? AND inCart = 1", whereArgs: [id]);
  }
}