//Model class for All previous Dictations
import 'dart:convert';

List<PreviousDictations> allPreviousDictationsFromJson(String str) => List<PreviousDictations>.from(json.decode(str).map((x) => PreviousDictations.fromJson(x)));

String allPreviousDictationsToJson(List<PreviousDictations> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreviousDictations {
  PreviousDictations({
    this.id,
    this.dictationId,
    this.episodeId,
    this.episodeAppointmentRequestId,
    this.attachmentName,
    this.memberId,
    this.fileName,
    this.createdDate,
    this.uploadedToServer,
    this.providerId,
    this.dos,
    this.displayFileName,
    this.dictationTypeId,
    this.appointmentProvider,
  });

  int id;
  int dictationId;
  int episodeId;
  int episodeAppointmentRequestId;
  String attachmentName;
  int memberId;
  String fileName;
  DateTime createdDate;
  bool uploadedToServer;
  int providerId;
  String dos;
  String displayFileName;
  int dictationTypeId;
  String appointmentProvider;

  factory PreviousDictations.fromJson(Map<String, dynamic> json) => PreviousDictations(
    id: json["id"],
    dictationId: json["dictationId"],
    episodeId: json["episodeId"],
    episodeAppointmentRequestId: json["episodeAppointmentRequestId"],
    attachmentName: json["attachmentName"],
    memberId: json["memberId"],
    fileName: json["fileName"],
    createdDate: DateTime.parse(json["createdDate"]),
    uploadedToServer: json["uploadedToServer"],
    providerId: json["providerId"],
    dos: json["dos"],
    displayFileName: json["displayFileName"],
    dictationTypeId: json["dictationTypeId"],
    appointmentProvider: json["appointmentProvider"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dictationId": dictationId,
    "episodeId": episodeId,
    "episodeAppointmentRequestId": episodeAppointmentRequestId,
    "attachmentName": attachmentName,
    "memberId": memberId,
    "fileName": fileName,
    "createdDate": createdDate.toIso8601String(),
    "uploadedToServer": uploadedToServer,
    "providerId": providerId,
    "dos": dos,
    "displayFileName": displayFileName,
    "dictationTypeId": dictationTypeId,
    "appointmentProvider": appointmentProvider,
  };
}
