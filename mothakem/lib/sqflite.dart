// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class sqflDB {
//   static Database? _db;

//   Future<Database?> get DB async {
//     if (_db == null) {
//       _db = await initialDB();
//       return _db;
//     } else {
//       return _db;
//     }
//   }

//   initialDB() async {
//     String database_path = await getDatabasesPath();
//     String path = join(database_path,
//         "mothakem2.db"); //==> join used to make path (database_path/first_app.db)
//     print("PAth: ${path}");

//     Database mydb = await openDatabase(path,
//         onCreate: _oncreate, version: 1, onUpgrade: _onupgrage);
//     return mydb;
//   }

//   _onupgrage(Database db, int oldVersion, int newVersion) async {
//     print("DB Upgraded");
//   }

//   _oncreate(Database db, int version) async {
//     await db.execute('''
// CREATE TABLE userData(
//   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//   name TEXT,
//   userName TEXT,
//   password TEXT,
//   phone TEXT
// )
// ''');

// //     await db.execute('''
// // CREATE TABLE simple(
// //   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
// //   title TEXT
// // )
// // ''');

    

//     print("DB created");
//   }

//   select(String sql) async {
//     Database? mydb = await DB;

//     List<Map> response = await mydb!.rawQuery(sql);
//     return response;
//   }

//   insert(String sql) async {
//     Database? mydb = await DB;

//     int response = await mydb!.rawInsert(sql);
//     return response;
//   }

//   update(String sql) async {
//     Database? mydb = await DB;

//     int response = await mydb!.rawUpdate(sql);
//     return response;
//   }

//   delete(String sql) async {
//     Database? mydb = await DB;

//     int response = await mydb!.rawDelete(sql);
//     return response;
//   }
// }
