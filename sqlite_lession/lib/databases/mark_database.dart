import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import '../models/mark.dart';



class MarkDatabase {

  final String DB_NAME = "information.db";
  final String TABLE = "information";
  final String ID = "id";
  final String TOAN = "toan";
  final String VAN = "van";
  final String ANH = "anh";
  final String DIEM_TRUNG_BINH = "diem_trung_binh";
  final String HOC_LUC = "hoc_luc";

  static final MarkDatabase _instance = MarkDatabase._();
  MarkDatabase._();

  factory MarkDatabase() {
    return _instance;
  }
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }

  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    var database = openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $TABLE(
        $ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $TOAN REAL,
        $VAN REAL,
        $ANH REAL,
        $DIEM_TRUNG_BINH REAL,
        $HOC_LUC TEXT)
    ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  // Có database sẵn
  // Future<Database> init() async {
  //   var databasesPath = await getDatabasesPath();
  //   var path = join(databasesPath, DB_NAME);
  //
  //   // Check if the database exists
  //   var exists = await databaseExists(path);
  //
  //   if (!exists) {
  //     // Should happen only the first time you launch your application
  //     print("Creating new copy from asset");
  //
  //     // Make sure the parent directory exists
  //     try {
  //       await Directory(dirname(path)).create(recursive: true);
  //     } catch (_) {}
  //
  //     // Copy from asset
  //     ByteData data = await rootBundle.load(join("assets/databases", DB_NAME));
  //     List<int> bytes =
  //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //
  //     // Write and flush the bytes written
  //     await File(path).writeAsBytes(bytes, flush: true);
  //
  //   } else {
  //     print("Opening existing database");
  //   }
  //   // open the database
  //   var db = await openDatabase(path, readOnly: true);
  //   return db;
  // }

  // CRUD: Create, Read, Update, Delete
  Future<int> addMark(Mark? mark) async {
    var client = await db;
    return client!.insert(TABLE, mark!.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Mark?> fetchWord(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$ID = ?', whereArgs: [id]);
    var maps = await futureMaps;
    if (maps.length != 0) {
      return Mark.fromJson(maps.first);
    }
    return null;
  }



  Future<List<Mark>> fetchAll() async {
    var client = await db;
    var res = await client!.query(TABLE);

    if (res.isNotEmpty) {
      var marks = res.map((markMap) => Mark.fromJson(markMap)).toList();
      return marks;
    }
    return [];
  }

  Future<int> updateWord(Mark mark) async {
    var client = await db;
    return client!.update(TABLE, mark.toJson(),
        where: '$ID = ?', whereArgs: [mark.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future closeDb() async {
    var client = await db;
    client!.close();
  }



}