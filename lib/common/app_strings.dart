import 'package:YOURDRS_FlutterAPP/common/app_constants.dart';

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
  static const patient_dob = "04-09-1995";
  static const pc_md = "PC_MD";
  static const patientFName = "abcdef";
  static const patientLName = "nnnnn";
  static const male_28 = "(Male,28)";
  static const dictationPending = "Dictation Pending";
  static const  defaultImage = "https://icon-library.com/images/person-image-icon/person-image-icon-6.jpg";
  static const  title = "Deirdre Ella";
  static const dateOfbirth="Date of Birth";
  static const caseNo="Case No";
  static const PC_MD="PC-MDS";
  static const dob="05-07-1996";
  static const caseId="Y3BGCT9812-2";
  static const status="Checked Out";
  static const submitImages="Submit Images";
  static const customPath = "/audio_recorder_";
  static const permissionMsg = "You must accept permissions";

  //Dictations
  static const textDictation = "Dictations";
  static const textMyDictation = "My Previous Dictations";
  static const textAllDictation = "All Previous Dictations";
  static const textUploaded = "Uploaded";

  //Database table
  static const databaseName =  'audio_manager.db';
  static const dbTableDictation = "Audio_Table";
  static const dbTableExternalDictation = 'External_Dictation';

  //Patient dictation and Manual dictation columns
  static const colId = 'id';
  // static const col_AudioFile = 'col_audioFile';
  static const col_dictationId = 'dictation_id';
  static const col_AudioFileName = 'fileName';
  static const col_PatientFname = 'patient_fname';
  static const col_PatientLname = 'patient_lname';
  static const col_CreatedDate = 'createdDate';
  static const col_Patient_DOB = 'patient_DOB';
  static const col_DictationTypeId = 'dictationTypeId';
  static const col_EpisodeId = 'episodeId';
  static const col_EpisodeAttachmentRequestId= 'episodeAttachmentRequestId';
  static const col_attachmentSizeBytes = 'attachmentSizeBytes';
  static const col_attachmentType = 'attachmentType';
  static const col_MemberId = 'memberId';
  static const col_StatusId = 'statusId';
  static const col_UploadedToServer = 'uploadedToServer';
  static const col_DisplayFileName = 'displayFileName';
  static const col_PhysicalFileName = 'physicalFileName';
  static const col_DOS = 'DOS';
  static const col_PracticeId = 'practiceId';
  static const col_LocationId = 'locationId';
  static const col_ProviderId = 'providerId';
  static const col_AppointmentTypeId = 'appointmentTypeId';
  static const col_PhotoNameList = 'photoNameList';
  static const col_isEmergencyAddOn = 'isEmergencyAddOn';
  static const col_ExternalDocumentTypeId = 'externalDocumentTypeId';
  static const col_Description = 'description';
  static const col_AppointmentProvider = 'appointmentProvider';
  static const col_isSelected = 'isSelected';

  //External dictation columns
  static const col_External_Id = 'col_id';
  static const col_ExternalPatientFname = 'col_patient_fname';
  static const col_ExternalPatientLname = 'col_patient_lname';
  static const col_ExternalCreatedDate = 'col_createdDate';
  static const col_ExternalPatient_DOB = 'col_patient_DOB';
  static const col_ExternalattachmentType = 'col_attachmentType';
  static const col_ExternalMemberId = 'col_memberId';
  static const col_ExternalStatusId = 'col_statusId';
  static const col_ExternalUploadedToServer = 'col_uploadedToServer';
  static const col_ExternalDisplayFileName = 'col_displayFileName';
  static const col_ExternalDOS = 'col_DOS';
  static const col_ExternalPracticeId = 'col_practiceId';
  static const col_ExternalLocationId = 'col_locationId';
  static const col_ExternalProviderId = 'col_providerId';
  static const col_ExternalAppointmentTypeId = 'col_appointmentTypeId';
  static const col_ExternalPhotoNameList = 'col_photoNameList';
  static const col_ExternalisEmergencyAddOn = 'col_isEmergencyAddOn';
  static const col_Ex_ExternalDocumentTypeId = 'col_externalDocumentTypeId';
  static const col_ExternalDes= 'col_description';

  //Queries
 static const deleteFilesBefore5min = "DELETE FROM Audio_Table WHERE databaseDateTime <= datetime('now', '-5 minutes')";
 //  static const deleteAllFile = "DELETE FROM Audio_Table WHERE createdDate = 2021-03-09";
  static const selectQuery = "SELECT * FROM Audio_Table";


  //Table for Patient Dictation and Manual Dictation
  static const tableDictation = 'CREATE TABLE Audio_Table('
  'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
  'dictation_id INTEGER,'
  // 'col_audioFile BLOB,'
  'fileName TEXT,'
  'patient_fname TEXT,'
  'patient_lname TEXT,'
  'patient_DOB TEXT,'
  'dictationTypeId,'
  'createdDate TEXT,'
  'episodeId INT,'
  'episodeAttachmentRequestId,'
  'attachmentSizeBytes,'
  'attachmentType,'
  'memberId,'
  'statusId,'
  'uploadedToServer,'
  'displayFileName,'
  'physicalFileName,'
  'DOS,'
  'practiceId,'
  'locationId,'
  'providerId,'
  'appointmentTypeId,'
  'photoNameList,'
  'isEmergencyAddOn,'
  'externalDocumentTypeId,'
  'description,'
  'appointmentProvider,'
  'isSelected'
  ')';

  //Table for External Dictation
  static const tableExternalDictation = 'CREATE TABLE External_Table('
      'col_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'col_externalAttachmentId,'
      // 'col_audio_fileName TEXT,'
      'col_patient_fname TEXT,'
      'col_patient_lname TEXT,'
      'col_patient_DOB TEXT,'
      'col_memberId,'
      'col_statusId,'
      'col_uploadedToServer,'
      'col_createdDate,'
      'col_displayFileName,'
      'col_DOS,'
      'col_practiceId,'
      'col_locationId,'
      'col_providerId,'
      'col_appointmentTypeId,'
      'col_photoNameList,'
      'col_externalDocumentTypeName,'
      'col_isEmergencyAddOn,'
      'col_externalDocumentTypeId,'
      'col_description'
      ')';

  //Dictation type list
  static const dictationTypeList = [
    "MR",
    "NBR",
    "OPR",
    ];
}

class ApiUrlConstants {

  static const getAllPreviousDictations = AppConstants.dioBaseUrl +
      'api/Dictation/GetPreviousDictations';
}

