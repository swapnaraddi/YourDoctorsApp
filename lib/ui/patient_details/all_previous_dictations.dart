import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/previous_dictations.dart';
import 'package:YOURDRS_FlutterAPP/data/services/get_all_previous_dictations.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:flutter/material.dart';

class AllPreviousDictations extends StatefulWidget {
  @override
  _AllPreviousDictationsState createState() => _AllPreviousDictationsState();
}

class _AllPreviousDictationsState extends State<AllPreviousDictations> {
  var isLoading = true;
  Services apiServices = Services();
  // List list = List();


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text(AppStrings.textDictation)),
          backgroundColor: CustomizedColors.appBarColor,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20,
            vertical: MediaQuery.of(context).size.height / 50,

          ),
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.textUploaded,
                          style: TextStyle(
                              color: CustomizedColors.uploadedTextColor,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: width * 0.045,
                        ),
                        Icon(
                          Icons.cloud_done,
                          size: 30,
                          color: CustomizedColors.dictationListIconColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Row(
                      children: [
                         FutureBuilder(
                            // future: DatabaseHelper.db.getAllDictations(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                if (snapshot.data != null) {
                                  List<PreviousDictations> list = snapshot.data;
                                  return ListView.separated(
                                    separatorBuilder: (context, index) => Divider(
                                      color: Colors.white,
                                    ),
                                    itemCount: list.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return
                                        Text( "${list[index].displayFileName}",
                                        style: TextStyle(fontSize: 16),
                                      );
                                    },
                                  );
                                    Text(
                                    'MR_hareesh_Y201243120_1_20210217_637496828593768180',
                                    style: TextStyle(fontSize: 16),
                                  );
                                }
                              }
                            },
                          ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 30,
                          color: CustomizedColors.dictationListIconColor,
                        ),
                        SizedBox(
                          width: width * 0.045,
                        ),
                        Icon(
                          Icons.play_circle_fill,
                          size: 30,
                          color: CustomizedColors.dictationListIconColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),

        /// calling the mic button widget from widget folder
        //floatingActionButton: MicButton(),
      ),
    );
  }

  _callFromApi() async {
    setState(() {});
    var apiProvider = Services();
    await apiProvider.getAllPreviousDictations();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }
}
