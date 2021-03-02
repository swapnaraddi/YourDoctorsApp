class AppStrings {
  static const welcome = 'Welcome';
  static const signIn = "Signin";
  static const tryAgain = "tryAgain";
  static const notNow = "notNow";

  //Patient Dictation Screen
  static const saveforlater= "save for later";
  static const dict= "Upload this dictation for transcription?";
  static const cancel = "Cancel";
  static const upload = "Upload";
  static const startfile = "start file";
  static const dicttype = "Select dectation type";
  static const camera = "camera";
  static const photolib = "photo library";
  static const dictationtype= "Dictation type";
  static const isStatFile = "Is Stat File";
  static const superBill = "Super Bill";
  static const allDictation = "All Dictations";
  static const allImages = "All Images";
  static const date = "02-12-2021";
  static const pc_md = "PC_MD";
  static const name = "Kdhhjvvk, kdhskfhk";
  static const male_28 = "(Male,28)";
  static const dictationPending = "Dictation Pending";
  static const  defaultImage = "https://icon-library.com/images/person-image-icon/person-image-icon-6.jpg";
  static const  title = "Deirdre Ella";
  static const dateOfbirth="Date of Birth";
  static const caseNo="Case No";
  static const PC_MD="PC-MDS";
  static const dob="02-07-1992";
  static const caseId="Y3BGCT9812-2";
  static const status="Checked Out";
  static const submitImages="Submit Images";
  static const customPath = "/flutter_audio_recorder_";
  static const permissionMsg = "You must accept permissions";

  //Database table
  static const databaseName =  'audio_manager.db';
  static const dbTableName = "Audio_Table";
  static const colId = 'col_id';
  static const col_AudioFile = 'col_audioFile';
  static const col_dictationId = 'col_dictation_id';
  static const col_AudioFileName = 'col_audio_fileName';
  static const col_PatientFname = 'col_patient_fname';
  static const col_PatientLname = 'col_patient_lname';
  static const col_DateAndTime = 'col_dateAndTime';
  static const col_Patient_DOB = 'col_patient_DOB';
  static const deleteAllFile = 'DELETE FROM Audio_Table';
  static const selectQuery = "SELECT * FROM Audio_Table";

  static const tableDataDictation = 'CREATE TABLE Audio_Table('
  'col_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
  'col_dictation_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
  'col_audioFile BLOB,'
  'col_audio_fileName TEXT,'
  'col_patient_fname TEXT,'
  'col_patient_lname TEXT,'
  'col_dateAndTime TEXT,'
  'col_patient_DOB TEXT,'
  'col_dictationTypeId'
  ')';

  // static const tableDataExternalAttachment ='CREATE TABLE ExternalAttachment('
  //     'col_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
  //     'col_dictation_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
  //     'col_audioFile BLOB,'
  //     'col_audio_fileName TEXT,'
  //     'col_patient_fname TEXT,'
  //     'col_patient_lname TEXT,'
  //     'col_dateAndTime TEXT,'
  //     'col_patient_DOB TEXT,'
  //     'col_dictationTypeId'
  //     ')';
}
