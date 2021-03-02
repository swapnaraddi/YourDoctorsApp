class Dictation {
  int id;
  int externalAttachmentId;
  int memberId ;
  int StatusId;
  bool uploadedToServer;
  int statusId;
  String createdDate;
  String displayFileName;
  String photoNameList;
  String fileName; //name of the audio file
  String patientFirstName;
  String patientLastName;
  String patientDOB;
  String DOS;
  String externalDocumentTypeName;
  int practiceId;
  int locationId;
  int providerId;
  int appointmentTypeId;
  bool isEmergencyAddOn;
  int externalDocumentTypeId;
  String description;

  Dictation({
      this.id,
      this.externalAttachmentId,
      this.memberId,
      this.StatusId,
      this.uploadedToServer,
      this.statusId,
      this.createdDate,
      this.displayFileName,
      this.photoNameList,
      this.fileName,
      this.patientFirstName,
      this.patientLastName,
      this.patientDOB,
      this.DOS,
      this.externalDocumentTypeName,
      this.practiceId,
      this.locationId,
      this.providerId,
      this.appointmentTypeId,
      this.isEmergencyAddOn,
      this.externalDocumentTypeId,
      this.description});
}