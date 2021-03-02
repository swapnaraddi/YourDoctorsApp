import 'dart:typed_data';

class Dictation {
  int id;
  Uint8List audioFile;
  String dictationId;
  int episodeId;
  int episodeAppointmentRequestId;
  String attachmentName;
  int attachmentSizeBytes;
  String attachmentType;
  int memberId;
  int statusId;
  bool uploadedToServer;
  String createdDate;
  String displayFileName;
  String fileName;  //name of the audio file
  String physicalFileName; //path
  String patientFirstName;
  String patientLastName;
  String patientDOB;
  String DOS;
  int practiceId;
  int locationId;
  int providerId;
  int appointmentTypeId;
  // String CPTCodeIds;
  String photoNameList;
  int dictationTypeId;
  bool isEmergencyAddOn;
  int externalDocumentTypeId;
  String description;
  String appointmentProvider;
  bool isSelected;

  Dictation({this.id, this.audioFile,this.dictationId,this.episodeId,this.episodeAppointmentRequestId,this.attachmentName,this.attachmentSizeBytes,this.attachmentType,this.memberId,this.statusId,this.uploadedToServer,
  this.createdDate,this.displayFileName,this.fileName,this.physicalFileName,this.patientFirstName,this.patientLastName,this.patientDOB,this.DOS,this.practiceId,this.locationId,this.providerId,
    this.appointmentTypeId, this.photoNameList,this.dictationTypeId,this.isEmergencyAddOn,this.externalDocumentTypeId,this.description,this.appointmentProvider,this.isSelected});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'audioFile': audioFile,
      'dictation_id': dictationId,
      'episode_id' : episodeId,
      'episodeAppointmentRequestId' : episodeAppointmentRequestId,
      'attachmentName': attachmentName,
      'attachmentSizeBytes':attachmentSizeBytes,
      'attachmentType':attachmentType,
      'memberId':memberId,
      'statusId':statusId,
      'uploadedToServer':uploadedToServer,
      'createdDate':createdDate,
      'displayFileName':displayFileName,
      'fileName':fileName,
      'physicalFileName':physicalFileName,
      'patientFirstName':patientFirstName,
      'patientLastName':patientLastName,
      'patientDOB':patientDOB,
      'DOS':DOS,
      'practiceId':practiceId,
      'locationId':locationId,
      'providerId':providerId,
      'appointmentTypeId':appointmentTypeId,
      // 'CPTCodeIds':CPTCodeIds,
      'photoNameList':photoNameList,
      'dictationTypeId':dictationTypeId,
      'isEmergencyAddOn':isEmergencyAddOn,
      'externalDocumentTypeId':externalDocumentTypeId,
      'description':description,
      'appointmentProvider':appointmentProvider,
      'isSelected':isSelected
    };
    return map;
  }

  Dictation.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    audioFile = map['audioFile'];
    dictationId = map['dictation_id'];
    episodeId = map['episode_id'];
    episodeAppointmentRequestId = map['episodeAppointmentRequestId'];
    attachmentName = map['attachmentName'];
    attachmentSizeBytes = map['attachmentSizeBytes'];
    attachmentType = map['attachmentType'];
    memberId = map['memberId'];
    statusId = map['statusId'];
    uploadedToServer = map['uploadedToServer'];
    createdDate = map['createdDate'];
    displayFileName = map['displayFileName'];
    fileName = map['fileName'];
    physicalFileName = map['physicalFileName'];
    patientFirstName = map['patientFirstName'];
    patientLastName = map['patientLastName'];
    patientDOB = map['patientDOB'];
    DOS = map['DOS'];
    practiceId = map['practiceId'];
    locationId = map['locationId'];
    providerId = map['providerId'];
    appointmentTypeId = map['appointmentTypeId'];
    // CPTCodeIds = map['CPTCodeIds'];
    photoNameList = map['photoNameList'];
    dictationTypeId = map['dictationTypeId'];
    isEmergencyAddOn = map['isEmergencyAddOn'];
    externalDocumentTypeId = map['externalDocumentTypeId'];
    description = map['description'];
    appointmentProvider = map['appointmentProvider'];
    isSelected = map['isSelected'];
  }
}
