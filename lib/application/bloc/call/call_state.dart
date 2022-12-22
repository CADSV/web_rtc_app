//Project imports:
part of 'call_bloc.dart';

//CallState: Here we define the states of the CallBloc.
abstract class CallState {}

class CallStateInitial extends CallState {}

class CallStateLoading extends CallState {}

class CallStateHideLoading extends CallState {}

class CallStateSuccess extends CallState {}

