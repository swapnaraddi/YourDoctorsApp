
import 'package:YOURDRS_FlutterAPP/blocs/audio_bloc.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'audio_recording.dart';

class PatientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  // final TimerBloc _timerBloc = TimerBloc();

  File _image;
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Anuradha S'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://icon-library.com/images/person-image-icon/person-image-icon-6.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('02-12-1998'),
                        Text('PC - MD'),
                        Text(
                          'Anuradha S Dharwad',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('(Female 128)'),
                        Text('Dictation Pending'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.isStatFile,
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: CustomizedColors.uploadiconColor,
                      activeTrackColor: CustomizedColors.uploadiconColor,
                      inactiveThumbColor: CustomizedColors.uploadiconColor,
                      inactiveTrackColor: Colors.grey,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: FlatButton(
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider(
                                create: (context) => AudioBloc(),
                                child: Card(
                                  child: Container(
                                    height: 500,
                                    child: AudioRecorderWidget(),
                                  ),
                                ),
                              );
                            },
                          );
                          Alert(
                            context: context,
                            title: AppStrings.dicttype,
                            content: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CustomizedColors.alertColor,
                              ),
                              margin: EdgeInsets.only(top: 25),
                              width: 230,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Container(
                                      margin: EdgeInsets.only(left: 60),
                                      child: Text(
                                        AppStrings.dictationtype,
                                        style: TextStyle(color: CustomizedColors.textColor),
                                      )
                                  ),
                                  items: <String>[
                                    'Surgery',
                                    'Non-Surgery',
                                    'MRI',
                                    'Operative'
                                  ].map((String value) {
                                    return  DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            ),
                            buttons: [
                              DialogButton(
                                color: CustomizedColors.alertCancelColor,
                                child: Text(
                                  AppStrings.cancel,
                                  style: TextStyle(
                                      color: CustomizedColors.textColor, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        }),
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  ),
                  SizedBox(width: 40),
                  Container(
                    child: FlatButton(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        final action = CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt, color: Colors.blue),
                                  Text(AppStrings.camera),
                                ],
                              ),
                              onPressed: () {
                                openCamera();
                                //print("Camera clicked");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.photo_library_outlined,
                                      color: Colors.blue),
                                  Text(AppStrings.photolib),
                                ],
                              ),
                              onPressed: () {
                                openGallery();
                                //print("Photo Library clicked");
                              },
                            )
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: Text(AppStrings.cancel),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        );

                        showCupertinoModalPopup(
                            context: context, builder: (context) => action);
                      },
                    ),
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    // color: CustomizeColors.iconGreyColor,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date of Birth',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '02-11-1998',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Case No',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Y2133434545',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PC - NO',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Checked Out',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_books_sharp,
                          size: 30,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          AppStrings.superBill,
                          style: TextStyle(
                              fontSize: 18, color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_books_sharp,
                          size: 30,
                         color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          AppStrings.allDictation,
                          style: TextStyle(
                              fontSize: 18, color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Open the phone camera
  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  //Open the phone gallery
  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }
}
