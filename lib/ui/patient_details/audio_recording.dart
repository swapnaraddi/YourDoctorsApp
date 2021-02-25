import 'dart:async';
import 'dart:io';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/audio.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:audio_wave/audio_wave.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';

class PlayIcon extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<PlayIcon> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: SafeArea(
          child: new RecorderExample(),
        ),
      ),
    );
  }
}

class RecorderExample extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  RecorderExample({localFileSystem}) : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new RecorderExampleState();
}

class RecorderExampleState extends State<RecorderExample>
// with SingleTickerProviderStateMixin
{
// AnimationController _animationController;
// bool isPlaying = false;

  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  bool viewVisible = false;
  var countdown;

  Timer _timer;


  @override
  void initState() {
// TODO: implement initState
    super.initState();
// _animationController =
// AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    if (mounted) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${_current?.duration.toString()}"),
                  FlatButton(
                      onPressed: () async {
                        _stop();
                        var audioFile = await File(_current.path).readAsBytes();
                        DatabaseHelper.db.insertAudio(Audio(audioFile: audioFile));
                        _init();
                      },
                      // _currentStatus != RecordingStatus.Unset ? _stop : null,
                      child: Text(
                        AppStrings.saveforlater,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomizedColors.uploadiconColor,
                            fontSize: 18),
                      ))
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.lightBlue[50],
                    child: Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: viewVisible,
                      child: AudioWave(
                        height: 150,
                        width: 365,
                        spacing: 2.5,
                        bars: [
                          //Static wave
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 70, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 50, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 40, color: CustomizedColors.waveColor),
                          AudioWaveBar(
                              height: 20, color: CustomizedColors.waveColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        switch (_currentStatus) {
                          case RecordingStatus.Initialized:
                            {
                              _start();
                              break;
                            }
                          case RecordingStatus.Recording:
                            {
                              _pause();
                              break;
                            }
                          case RecordingStatus.Paused:
                            {
                              _resume();
                              break;
                            }
                          case RecordingStatus.Stopped:
                            {
                              _init();
                              break;
                            }
                          default:
                            break;
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: CustomizedColors.waveColor,
                        child: _buildText(_currentStatus),
                        radius: 25,
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        //Upload audio popup
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Card(
                              child: Container(
                                height: 220,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload,
                                      size: 75,
                                      color: CustomizedColors.waveColor,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppStrings.dict,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              AppStrings.cancel,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: CustomizedColors.cancelBtnColor),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: RaisedButton(
                                            onPressed: () {},
                                            child: Text(
                                              AppStrings.upload,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: CustomizedColors.textColor),
                                            ),
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.cloud_upload,
                        size: 60,
                        color: CustomizedColors.waveColor,
                      )),
                  CircleAvatar(
                    backgroundColor: CustomizedColors.cicleAvatarBgColor,
                    child: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 45,
                      ),
                      onTap: () {
                        //Delete the record and reset
                        _reset();
                        print("Reset called");
                      },
                    ),
                    radius: 30,
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  _init() async {
    try {
      viewVisible = false;
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = '/flutter_audio_recorder_';
        Directory appDocDirectory;
        // io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
        }
        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString()+".mp4";

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.AAC);

        await _recorder.initialized;
        // after initialization
        var current = await _recorder.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current.status;
          print(_currentStatus);
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  //Start the recording
  _start() async {
    try {
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);
      setState(() {
        viewVisible = true;
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      _timer = Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = current.status;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  ///Reset the Timer
  _reset() async {
    try {
      await _recorder.stop();
      var recording = await _recorder.current(channel: 0);
      print('${recording.status}');
      if (_timer.isActive) {
        _timer.cancel();
        _timer = null;
      }
      // setState(() {
      //   _currentStatus = recording.status;
      // });
      var result = await _recorder.stop();
      var res = await File(result.path).delete();
      print("Deleted $res");
      _init();

    } catch (e) {
      print(e);
    }
  }

  //Resume the record
  _resume() async {
    await _recorder.resume();
    setState(() {
      viewVisible = true;
    });
  }

  //Pause the audio
  _pause() async {
    await _recorder.pause();
    var recording = await _recorder.current(channel: 0);
    // print('${recording.path}');
    setState(() {
      viewVisible = false;
    });
  }

  _stop() async {
    var result = await _recorder.stop();
    print("Stop recording: ${result.duration} ${result.path}");
    // File file = widget.localFileSystem.file(result.path);
    // print("File length: ${await file.length()}");
    setState(() {
      viewVisible = false;
      _current = result;
      _currentStatus = _current.status;
    });
  }

  Widget _buildText(RecordingStatus status) {
    var icon;
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          icon = Icons.not_started;
          break;
        }
      case RecordingStatus.Recording:
        {
          icon = Icons.pause;
          break;
        }
      case RecordingStatus.Paused:
        {
          icon = Icons.play_arrow;
          break;
        }
      case RecordingStatus.Stopped:
        {
          icon = Icons.stop_outlined;
          break;
        }
      default:
        break;
    }
    return Icon(
      icon,
      color: CustomizedColors.textColor,
      size: 30,
    );
  }

  void onPlayAudio() async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(_current.path, isLocal: true);
  }
}
