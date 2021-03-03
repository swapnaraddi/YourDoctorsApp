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
  static const patient_dob = "02-12-2021";
  static const pc_md = "PC_MD";
  static const patientFName = "Karthik";
  static const patientLName = "S";
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
  static const dbTableDictation = "Audio_Table";
  static const dbTableExternalDictation = 'External_Dictation';

  //Patient dictation and Manual dictation columns
  static const colId = 'col_id';
  // static const col_AudioFile = 'col_audioFile';
  static const col_dictationId = 'col_dictation_id';
  static const col_AudioFileName = 'col_audio_fileName';
  static const col_PatientFname = 'col_patient_fname';
  static const col_PatientLname = 'col_patient_lname';
  static const col_CreatedDate = 'col_createdDate';
  static const col_Patient_DOB = 'col_patient_DOB';
  static const col_DictationTypeId = 'col_dictationTypeId';
  static const col_EpisodeId = 'col_episodeId';
  static const col_EpisodeAttachmentRequestId= 'col_episodeAttachmentRequestId';
  static const col_attachmentSizeBytes = 'col_attachmentSizeBytes';
  static const col_attachmentType = 'col_attachmentType';
  static const col_MemberId = 'col_memberId';
  static const col_StatusId = 'col_statusId';
  static const col_UploadedToServer = 'col_uploadedToServer';
  static const col_DisplayFileName = 'col_displayFileName';
  static const col_PhysicalFileName = 'col_physicalFileName';
  static const col_DOS = 'col_DOS';
  static const col_PracticeId = 'col_practiceId';
  static const col_LocationId = 'col_locationId';
  static const col_ProviderId = 'col_providerId';
  static const col_AppointmentTypeId = 'col_appointmentTypeId';
  static const col_PhotoNameList = 'col_photoNameList';
  static const col_isEmergencyAddOn = 'col_isEmergencyAddOn';
  static const col_ExternalDocumentTypeId = 'col_externalDocumentTypeId';
  static const col_Description = 'col_description';
  static const col_AppointmentProvider = 'col_appointmentProvider';
  static const col_isSelected = 'col_isSelected';

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
  static const deleteAllFile = 'DELETE FROM Audio_Table';
  static const selectQuery = "SELECT * FROM Audio_Table";


  //Table for Patient Dictation and Manual Dictation
  static const tableDictation = 'CREATE TABLE Audio_Table('
  'col_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
  'col_dictation_id INTEGER,'
  // 'col_audioFile BLOB,'
  'col_audio_fileName TEXT,'
  'col_patient_fname TEXT,'
  'col_patient_lname TEXT,'
  'col_patient_DOB TEXT,'
  'col_dictationTypeId,'
  'col_episodeId,'
  'col_episodeAttachmentRequestId,'
  'col_attachmentSizeBytes,'
  'col_attachmentType,'
  'col_memberId,'
  'col_statusId,'
  'col_uploadedToServer,'
  'col_createdDate,'
  'col_displayFileName,'
  'col_physicalFileName,'
  'col_DOS,'
  'col_practiceId,'
  'col_locationId,'
  'col_providerId,'
  'col_appointmentTypeId,'
  'col_photoNameList,'
  'col_isEmergencyAddOn,'
  'col_externalDocumentTypeId,'
  'col_description,'
  'col_appointmentProvider,'
  'col_isSelected'
  ')';

  //Table for External Dictation
  static const tableExternalDictation = 'CREATE TABLE External_Table('
      'col_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'col_externalAttachmentId,'
      'col_audio_fileName TEXT,'
      'col_patient_fname TEXT,'
      'col_patient_lname TEXT,'
      'col_patient_DOB TEXT,'
      'col_memberId,'
      'col_statusId,'
      'col_uploadedToServer,'
      'col_createdDate,'
      'col_displayFileName,'
      'col_DOS,'
      'col_fileName,'
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
