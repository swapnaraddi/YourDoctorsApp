import 'dart:io';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/audio_recording.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/material_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Patient_Dectation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Patient_Dectation_State();
  }
}

class Patient_Dectation_State extends State<Patient_Dectation> {
  bool widgetVisible = false;
  Directory directory;
  bool isSwitched = false;
  List imageArray = [];
  var image;


  //function for switch button
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          height: 105,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 90,
                              width: 90,
                              child: Image.asset(AppStrings.defaultImage),
                            ),
                          ),
                          margin: EdgeInsets.only(left: 30),
                        ),

                        //To Display patient details
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.date,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: CustomizedColors.addressTextColor),
                              ),
                              Text(
                                AppStrings.pc_md,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: CustomizedColors.addressTextColor),
                              ),
                              Text(
                                AppStrings.name,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: CustomizedColors.addressTextColor),
                              ),
                              Text(
                                AppStrings.male_28,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: CustomizedColors.addressTextColor),
                              ),
                              Text(
                                AppStrings.dictationPending,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: CustomizedColors.addressTextColor),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(
                              left: 23, top: 50, bottom: 30),
                          // color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: 200,
            ),

            //For Switch button
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Text(AppStrings.startfile, style: TextStyle(fontSize: 15)),
                  SizedBox(
                    width: 20,
                  ),
                  Transform.scale(
                      scale: 1.5,
                      child: Switch(
                        onChanged: toggleSwitch,
                        value: isSwitched,
                        activeColor: CustomizedColors.switchactiveColor,
                        activeTrackColor: CustomizedColors.swicthtrackColor,
                        inactiveThumbColor: CustomizedColors.swicththumbColor,
                        inactiveTrackColor: CustomizedColors.inactiveTrackColor,
                      )),
                ]),
            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button for mic
                MaterialButtons(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Card(
                          child: Container(
                            height: 500,
                            child: AudioRecorderPopup(),
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
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
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
                  },
                  iconData: Icons.mic,
                ),
                //Button for camera
                MaterialButtons(
                    onPressed: () {
                      // CupertinoActionSheet for camera and gallery
                      final action = CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.camera),
                              ],
                            ),
                            onPressed: () {
                              // to open camera
                              // openCamera();
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.photolib),
                              ],
                            ),
                            onPressed: () {
                              //to open gallery
                              // openGallery();
                              Navigator.pop(context);
                            },
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text(AppStrings.cancel),
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                      showCupertinoModalPopup(
                          context: context, builder: (context) => action);
                    },
                    iconData: Icons.camera_alt),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            //to upload images from camera and gallery
            Visibility(
              visible: widgetVisible,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(children: [
                      Container(

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CustomizedColors.homeSubtitleColor,
                            ),
                          ),
                          height: 100,
                         // color: Colors.green,
                          child: imageArray.isEmpty
                              ? Text('No image selected.')
                              : GridView.count(
                                  crossAxisCount: 6,
                                  children: List.generate(imageArray.length,
                                      (generator) {
                                    var img = imageArray[generator];
                                    return Container(
                                        padding: EdgeInsets.all(5),
                                        // decoration: BoxDecoration(border: Border.all(width: 1)),
                                        child: Image.file(img,width: 10,height: 10,fit: BoxFit.contain,));
                                  })))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedBtn(
                        text: AppStrings.submitImages,
                        onPressed: () async {
                          final Directory directory = await getExternalStorageDirectory();
                          String path='${directory.path}/YourDrsImages';
                          final myImgDir = await Directory(path).create(recursive: true);
                          final File newImage = await image.copy('${myImgDir.path}/${basename(image.path)}');
                          setState(() {
                            imageArray.add(newImage);
                            widgetVisible = false;
                          });
                        },
                        iconData: Icons.image),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //List detail of patient
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomizedColors.homeSubtitleColor,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(AppStrings.dateOfbirth),
                    trailing: Text(AppStrings.dob),
                  ),
                  ListTile(
                    leading: Text(AppStrings.caseNo),
                    trailing: Text(AppStrings.caseId),
                  ),
                  ListTile(
                    leading: Text(AppStrings.PC_MD),
                    trailing: Text(AppStrings.pc_md),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //Buttons for functionality
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              RaisedBtn(
                  text: AppStrings.superBill,
                  onPressed: () {},
                  iconData: Icons.description_outlined),
              SizedBox(
                height: 15,
              ),
              RaisedBtn(
                  text: AppStrings.allDictation,
                  onPressed: () {},
                  iconData: Icons.mic_rounded),
              SizedBox(
                height: 15,
              ),
              RaisedBtn(
                  text: AppStrings.allImages,
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => UploadedImages()));
                  },
                  iconData: Icons.camera_alt),
            ]),
          ],
        ),
      ),
    );
  }
}
