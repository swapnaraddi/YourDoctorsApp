import 'dart:io';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;
  static final DatabaseHelper db = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the User table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, AppStrings.databaseName);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(AppStrings.tableDataDictation
          // 'CREATE TABLE Audio_Table('
          // 'col_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          // 'col_dictation_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          // 'col_audioFile BLOB,'
          // 'col_audio_fileName TEXT,'
          // 'col_patient_fname TEXT,'
          // 'col_patient_lname TEXT,'
          // 'col_dateAndTime TEXT,'
          // 'col_patient_DOB TEXT,'
          // 'col_dictationTypeId'
          // ')'
          );

      // await db.execute(AppStrings.tableDataExternalAttachment
      // );
    });
  }

  // Insert Audio
  insertAudio(Dictation newAudio) async {
    // await deleteAllAudios();
    final db = await database;
    final res = await db.insert(AppStrings.dbTableName, {
      AppStrings.colId: newAudio.id,
      AppStrings.col_AudioFile: newAudio.audioFile,
      AppStrings.col_dictationId: newAudio.dictationId,
      AppStrings.col_AudioFileName: newAudio.fileName,
      AppStrings.col_PatientFname: newAudio.patientFirstName,
      AppStrings.col_PatientLname: newAudio.patientLastName,
      AppStrings.col_DateAndTime: newAudio.createdDate,
      AppStrings.col_Patient_DOB: newAudio.patientDOB,
    });
    print("insertAudio $res ${newAudio.audioFile.length}");
    return res;
  }

  // Delete all Audios
  Future<int> deleteAllAudios() async {
    final db = await database;
    final res = await db.rawDelete(AppStrings.deleteAllFile);

    return res;
  }

  // Future<int> updateAudios() async {
  //   final db = await database;
  //   final updateRes = await db.rawUpdate("UPDATE User SET username = 'John' WHERE id = 1");
  //   print(updateRes);
  //   return updateRes;
  // }

  Future<List<Dictation>> getAllAudios() async {
    final db = await database;
    // final res = await db.rawQuery("SELECT * FROM EMPLOYEE");

    //Exception handling
    try {
      final res = await db.rawQuery(AppStrings.selectQuery);

      // print('data is saving $res');

      List<Dictation> list = res.isNotEmpty
          ? res.map((c) {
              print('res.map $c');

              final user = Dictation.fromMap(c);
              return user;
            }).toList()
          : [];
      print(list);
      return list;

    } catch (e) {
      print(e.toString());
    }
  }

  //Close the Databse
  DatabaseHelper.close();
}
