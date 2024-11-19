import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDBService extends GetxService {
  late Database _db;

  Future<LocalDBService> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'friends.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE friends(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, picture TEXT)',
        );
      },
      version: 1,
    );
    return this;
  }

  Future<int> addFriend(String name, String picture) async {
    return await _db.insert('friends', {
      'name': name,
      'picture': picture,
    });
  }

  Future<int> deleteFriend(int id) async {
    return await _db.delete(
      'friends',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getFriends() async {
    return await _db.query('friends');
  }
}
