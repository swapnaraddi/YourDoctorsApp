import 'dart:io';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/dictation.dart';
import 'package:YOURDRS_FlutterAPP/data/model/external_dictation.dart';
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
      await db.execute(AppStrings.tableDictation
      );

      await db.execute(AppStrings.tableExternalDictation
      );
    });
  }

  // Insert Audio and Manual dictation
  insertAudio(Dictation newAudio) async {
    await deleteAllAudios();
    var db = await database;

    //Exception handling
    try {
      var res = await db.insert(AppStrings.dbTableDictation, {
        AppStrings.colId: newAudio.id,
        // AppStrings.col_AudioFile :newAudio.audioFile,
        AppStrings.col_dictationId: newAudio.dictationId,
        AppStrings.col_AudioFileName: newAudio.fileName,
        AppStrings.col_PatientFname: newAudio.patientFirstName,
        AppStrings.col_PatientLname: newAudio.patientLastName,
        AppStrings.col_CreatedDate: newAudio.createdDate,
        AppStrings.col_Patient_DOB: newAudio.patientDOB,
        AppStrings.col_DictationTypeId:newAudio.dictationTypeId,
        AppStrings.col_EpisodeId:newAudio.episodeId,
        AppStrings.col_EpisodeAttachmentRequestId:newAudio.episodeAppointmentRequestId,
        AppStrings.col_attachmentSizeBytes:newAudio.attachmentSizeBytes,
        AppStrings.col_attachmentType:newAudio.attachmentType,
        AppStrings.col_MemberId:newAudio.memberId,
        AppStrings.col_StatusId:newAudio.statusId,
        AppStrings.col_UploadedToServer:newAudio.uploadedToServer,
        AppStrings.col_DisplayFileName:newAudio.displayFileName,
        AppStrings.col_PhysicalFileName:newAudio.physicalFileName,
        AppStrings.col_DOS:newAudio.dos,
        AppStrings.col_PracticeId:newAudio.practiceId,
        AppStrings.col_LocationId:newAudio.locationId,
        AppStrings.col_ProviderId:newAudio.providerId,
        AppStrings.col_AppointmentTypeId:newAudio.appointmentTypeId,
        AppStrings.col_PhotoNameList:newAudio.photoNameList,
        AppStrings.col_isEmergencyAddOn:newAudio.isEmergencyAddOn,
        AppStrings.col_ExternalDocumentTypeId:newAudio.externalDocumentTypeId,
        AppStrings.col_Description:newAudio.description,
        AppStrings.col_AppointmentProvider:newAudio.appointmentProvider,
        AppStrings.col_isSelected:newAudio.isSelected,

      });
      print("insertAudio $res");
      return res;
    }
  catch (e){
      print(e.toString());
  }
  }

  // Insert External Dictation
  insertExternalDictationData(ExternalDictation eDict) async {
    var db = await database;

    //Exception handling
    try {
      var externalDict = await db.insert(AppStrings.dbTableExternalDictation, {
        AppStrings.col_External_Id:eDict,
        AppStrings.col_ExternalPatientFname: eDict.patientFirstName,
        AppStrings.col_ExternalPatientLname: eDict.patientLastName,
        AppStrings.col_ExternalCreatedDate: eDict.createdDate,
        AppStrings.col_ExternalPatient_DOB: eDict.patientDOB,
        AppStrings.col_ExternalMemberId:eDict.memberId,
        AppStrings.col_ExternalStatusId:eDict.statusId,
        AppStrings.col_ExternalUploadedToServer:eDict.uploadedToServer,
        AppStrings.col_ExternalDisplayFileName:eDict.displayFileName,
        AppStrings.col_ExternalDOS:eDict.dos,
        AppStrings.col_ExternalPracticeId:eDict.practiceId,
        AppStrings.col_ExternalLocationId:eDict.locationId,
        AppStrings.col_ExternalAppointmentTypeId:eDict.appointmentTypeId,
        AppStrings.col_ExternalisEmergencyAddOn:eDict.isEmergencyAddOn,
        AppStrings.col_Ex_ExternalDocumentTypeId:eDict.externalDocumentTypeId,
        AppStrings.col_ExternalDes:eDict.description

      });
      // print("insertAudio $externalDict ${newAudio.audioFile.length}");
      return externalDict;
    }
    catch (e){
      print(e.toString());
    }
  }

  // Delete all Audios files
   deleteAllAudios({int minutes = 5}) async {
    var db = await database;
    var res = await db.rawDelete("DELETE FROM Audio_Table WHERE createdDate <= datetime('now', '-${minutes} minutes')");

    return res;
  }

  // Future<int> updateAudios() async {
  //   final db = await database;
  //   final updateRes = await db.rawUpdate("UPDATE User SET username = 'John' WHERE id = 1");
  //   print(updateRes);
  //   return updateRes;
  // }

  Future<List<Dictation>> getAllDictations() async {
    var db = await database;
    // final res = await db.rawQuery("SELECT * FROM EMPLOYEE");

    //Exception handling
    try {
      var res = await db.rawQuery(AppStrings.selectQuery);

      // print('data is saving $res');

      List<Dictation> list = res.isNotEmpty
          ? res.map((c) {
              print('res.map $c');

              var user = Dictation.fromMap(c);
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
  //  db.close();
}
