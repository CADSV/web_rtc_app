//Project imports:
part of 'requestCall_bloc.dart';

///RequestCallEvent: Here we define the events of the RequestCallBloc.
abstract class RequestCallEvent {}


class RequestCallEventFetchBasicData extends RequestCallEvent {}

class RequestCallEventNavigateToWith extends RequestCallEvent {
  final String routeName;
  RequestCallEventNavigateToWith(this.routeName);
}

