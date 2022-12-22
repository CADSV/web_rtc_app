//Project imports:
part of 'request_call_bloc.dart';

//RequestCallState: Here we define the states of the RequestCallBloc.
abstract class RequestCallState {}

class RequestCallStateInitial extends RequestCallState {}

class RequestCallStateLoading extends RequestCallState {}

class RequestCallStateHideLoading extends RequestCallState {}

class RequestCallStateSuccess extends RequestCallState {}

