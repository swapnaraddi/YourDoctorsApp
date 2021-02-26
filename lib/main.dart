import 'package:YOURDRS_FlutterAPP/ui/patient_details/patient_details.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_dictation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: PatientDetails(),
    );
  }
}

