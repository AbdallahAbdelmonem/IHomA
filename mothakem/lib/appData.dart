// import 'package:mothakem/sqflite.dart';

// class AppData {
//   sqflDB db = sqflDB();

//   getData() async {
//     List<Map> response = await db.select("SELECT * FROM userData");

//     return response;
//   }

//   setData(String name, String userName, String password, String phone) async {
//     int response = await db.insert(
//         "INSERT INTO userData (name,userName,password,phone) VALUES ('${name}','${userName}','${password}','${phone}')");
//     // print("$response");
//   }

//   updateData(String time, int id) async {
//     int response =
//         await db.update("UPDATE userData SET time='$time' WHERE id=$id ");

//     // print("$response");
//   }

//   deleteDate(int id) async {
//     await db.delete("DELETE FROM userData WHERE id='$id'");
//   }
// }
