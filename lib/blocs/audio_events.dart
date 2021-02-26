import 'base/base_bloc_event.dart';

abstract class AudioBlocEvent extends BaseBlocEvent {}

class InitRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class StartRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class PauseRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class ResumeRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class StopRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class DeleteRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}

class SaveRecord extends AudioBlocEvent {
  @override
  List<Object> get props => [];
}
