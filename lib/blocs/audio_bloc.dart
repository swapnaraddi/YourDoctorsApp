import 'dart:async';
import 'dart:io';

import 'package:YOURDRS_FlutterAPP/data/model/dictation.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';

import 'audio_events.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioBlocEvent, AudioBlocState> {
  FlutterAudioRecorder _recorder;
  // var countdown;

  Timer _timer;

  AudioBloc() : super(AudioBlocState.initial());

  @override
  Stream<AudioBlocState> mapEventToState(AudioBlocEvent event,) async* {
    if (event is InitRecord) {
      yield* _init();
    }
    else if (event is StartRecord) {
      yield* _start();
    }
    else if (event is PauseRecord) {
      yield* _pause();
    }
    else if (event is PauseRecord) {
      yield* _resume();
    }
    else if (event is StopRecord) {
      yield* _stop();
    }
    else if (event is DeleteRecord) {
      yield* _reset();
    }
    else if (event is SaveRecord) {
      yield* _stop();
      var audioFile = await File(state.current.path).readAsBytes();
      // DatabaseHelper.db.insertAudio(Dictation(audioFile: audioFile));
      yield* _init();
    }
  }

  Stream<AudioBlocState> _init() async* {
    try {
      yield state.copyWith(viewVisible: false);

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
            DateTime
                .now()
                .millisecondsSinceEpoch
                .toString() + ".mp4";

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.AAC);

        await _recorder.initialized;
        // after initialization
        var current = await _recorder.current(channel: 0);
        print('${current.status}');


        // should be "Initialized", if all working fine
        // setState(() {
        //   _current = current;
        //   _currentStatus = current.status;
        //
        // });
        yield state.copyWith(
            current: current,
            currentStatus: current.status,
        );
      } else {
        yield state.copyWith(
            errorMsg: 'You must accept permissions'
        );
        // Scaffold.of(context).showSnackBar(
        //     new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
      yield state.copyWith(
          errorMsg: e.toString()
      );
    }
  }

  //Start the recording
  Stream<AudioBlocState> _start() async* {
    try {
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);

      // setState(() {
      //   viewVisible = true;
      //   _current = recording;
      // });

      yield state.copyWith(
        viewVisible: true,
        current: recording,
        currentStatus: recording.status,
      );

      const tick = const Duration(milliseconds: 50);
      _timer = Timer.periodic(tick, (Timer t) async {
        if (state.currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        // setState(() {
        //   _current = current;
        //   _currentStatus = current.status;
        // });

        state.copyWith(
            current: current,
            currentStatus: current.status,
        );
      });

      yield state;
    } catch (e) {
      print(e);
      yield state.copyWith(
        viewVisible: false,
          errorMsg: e.toString()
      );
    }
  }

  ///Reset the Timer
  Stream<AudioBlocState> _reset() async* {
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
      yield state.copyWith(
          errorMsg: e.toString()
      );
    }
  }

  //Resume the record
  Stream<AudioBlocState> _resume() async* {
    await _recorder.resume();
    var recording = await _recorder.current(channel: 0);
    // setState(() {
    //   viewVisible = true;
    // });
    yield state.copyWith(
        viewVisible: true,
        currentStatus: recording.status,
        current: recording);
  }

  //Pause the audio
  Stream<AudioBlocState> _pause() async* {
    await _recorder.pause();
    var recording = await _recorder.current(channel: 0);
    // print('${recording.path}');
    // setState(() {
    //   viewVisible = false;
    // });
    yield state.copyWith(
        viewVisible: false,
        currentStatus: recording.status,
        current: recording);
  }

  Stream<AudioBlocState> _stop() async* {
    var result = await _recorder.stop();
    print("Stop recording: ${result.duration} ${result.path}");
    // File file = widget.localFileSystem.file(result.path);
    // print("File length: ${await file.length()}");
    // setState(() {
    //   viewVisible = false;
    //   _current = result;
    //   _currentStatus = _current.status;
    // });
    yield state.copyWith(
      viewVisible: false,
      current: result,
      currentStatus: result.status,
    );
  }
}
