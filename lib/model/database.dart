// import 'dart:async';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import './dataModel.dart';

// final translationsTable = "Translations";

// class DatabaseService {
//   static final DatabaseService _instance = DatabaseService._internal();
//   Future<Database> _db;

//   factory DatabaseService() =>_instance;
//   Future<Database> get db async{
//     if (_db !=null) {
//       return _db;
//     }
//     _db= await initDatabase();
//     return _db;
//   }

//   DatabaseService._internal() {
//     initDatabase();
//   }

//   initDatabase() async { 
//     Directory documentDir= await getApplicationDocumentsDirectory();
//      _db =(await openDatabase(
//       join( documentDir.path, 'translations.db'),
//       // When the database is first created, create a table to store data.
//       onCreate: (db, version) {
//         db.execute(
//           '''CREATE TABLE $translationsTable(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             newData TEXT,
//             Translations TEXT,
//             data_id TEXT,
//             createdTime DATETIME))
//           ''',
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: 1,
//     )) as Future<Database>; 
//   }

//   Future<int> insertNumber(DataModel translation) async {
//     Database db = await _db;
//     int id = await db.insert(translationsTable, translation.toMap());
//     return id;
//   }

//   // Future<DataModel> getNumber(int id) async {
//   //   Database db = await database;
//   //   List<Map> datas = await db.query(translationsTable,
//   //       where: 'id = ?',
//   //       whereArgs: [id]);
//   //   if (datas.length > 0) {
//   //     return DataModel.fromMap(datas.first);
//   //   }
//   //   return null;
//   // }
// }