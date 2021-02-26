import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

import 'base/base_bloc_state.dart';

class AudioBlocState extends BaseBlocState {
  final String errorMsg;
  final Recording current;
  final RecordingStatus currentStatus;
  final bool viewVisible;

  factory AudioBlocState.initial() => AudioBlocState(
        errorMsg: null,
        current: null,
        currentStatus: RecordingStatus.Unset,
        viewVisible: false,
      );

  AudioBlocState reset() => AudioBlocState.initial();

  AudioBlocState({
    this.errorMsg,
    this.current,
    this.currentStatus,
    this.viewVisible,
  });

  @override
  List<Object> get props => [
        this.errorMsg,
        this.current,
        this.currentStatus,
        this.viewVisible,
      ];

  AudioBlocState copyWith({
    String errorMsg,
    Recording current,
    RecordingStatus currentStatus,
    bool viewVisible,
  }) {
    return new AudioBlocState(
      errorMsg: errorMsg ?? this.errorMsg,
      current: current ?? this.current,
      currentStatus: currentStatus ?? this.currentStatus,
      viewVisible: viewVisible ?? this.viewVisible,
    );
  }

  @override
  String toString() {
    return 'AudioBlocState{errorMsg: $errorMsg, current: $current, currentStatus: $currentStatus, viewVisible: $viewVisible}';
  }
}
