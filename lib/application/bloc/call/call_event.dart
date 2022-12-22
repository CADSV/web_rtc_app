//Project imports:
part of 'call_bloc.dart';

///CallEvent: Here we define the events of the CallBloc.
abstract class CallEvent {}


class CallEventFetchBasicData extends CallEvent {}

class CallEventNavigateToWith extends CallEvent {
  final String routeName;
  CallEventNavigateToWith(this.routeName);
}

