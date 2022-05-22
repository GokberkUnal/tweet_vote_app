import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tweet_vote_app/models/tweet.dart';

class DataBaseHelper {
  static final _databaseName = "tweet.db";
  static final _databaseVersion = 1;
  static final columnId = 'id';
  static final table = 'tweet_table';
  static final columnTweet = 'tweet';
  static final columnLike = 'like';
  static final columnDislike = 'dislike';
  static final columnNeutral = 'neutral';
  static final columnIsVoted = 'isvoted';

  DataBaseHelper._privateContructor();
  static final DataBaseHelper instance = DataBaseHelper._privateContructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    print(path);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        ''' CREATE TABLE $table($columnId INTEGER PRIMARY KEY,$columnTweet TEXT NOT NULL,$columnLike INTEGER TEXT NOT NULL,$columnDislike INTEGER NOT NULL,$columnNeutral INTEGER NOT NULL,$columnIsVoted INTEGER NOT NULL
    )''');
  }

  Future<int> insert(Tweet tw) async {
    Database? db = await instance.database;
    return await db!.insert(table, {
      'id': tw.id,
      'tweet': tw.tweet,
      'like': tw.like,
      'dislike': tw.dislike,
      'neutral': tw.neutral,
      'isvoted': tw.isVoted
    });
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<List<Map<String, dynamic>>> queryRows(id) async {
    Database? db = await instance.database;
    return await db!.query(table, where: "$columnTweet LIKE '%$id%'");
  }

  Future<int> update(Tweet tw) async {
    Database? db = await instance.database;
    int id = tw.toMap()['id'];
    return await db!
        .update(table, tw.toMap(), where: '$columnId=?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId =?', whereArgs: [id]);
  }

  Future getCount() async {
    Database? db = await instance.database;

    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $_databaseName'));
  }

  Future<int> deleteAll() async {
    Database? db = await instance.database;
    return db!.rawDelete("DELETE FROM tweet_table");
  }
}
