//Package imports:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports
import 'package:web_rtc_app/infrastructure/core/navigator_manager.dart';
import 'package:web_rtc_app/infrastructure/utils/app_util.dart';
part 'call_event.dart';
part 'call_state.dart';


///CallBloc: Here we would have the Call domain logic.
class CallBloc extends Bloc<CallEvent, CallState> {

  //Here the StreamController can be a state or a DomainModel
  final _callStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();


 //Constructor
  //You have to declare the StateInitial as the first state
  CallBloc() : super(CallStateInitial()) {
    on<CallEventFetchBasicData>(_fetchBasicCallDataEventToState);
    on<CallEventNavigateToWith>(_navigateToEventToState);

  }


  //Variables:


  //Getters
    Stream<bool> get streamCall => _callStreamController.stream;


  //Setters


  //Methods:

  ///This method is called when the event is [CallEventFetchBasicData]
  ///It fetches the basic data of the Call page.
  void _fetchBasicCallDataEventToState(CallEvent event, Emitter<CallState> emit) async {

    emit(CallStateLoading());



    _loadView();
    emit(CallStateHideLoading());
  }


  ///This method is called when the event is [CallEventNavigateTo]
  ///It navigates to the specified page.
  void _navigateToEventToState(CallEventNavigateToWith event, Emitter<CallState> emit) {
     _dispose(); //TODO: Dispose cuando se navegue a main
    _navigatorManager.navigateTo(event.routeName);
  }






  //Private methods:


  //To load the view:
  void _loadView() => _callStreamController.sink.add(true);


  //To show the dialog:
  void _showDialog(String textTitle, String textQuestion, BuildContext dialogContext) async {
    // var newContext = getIt<ContextManager>().context;

    await AppUtil.showDialogUtil(
        context: dialogContext,
        title: textTitle,
        message: textQuestion
      );
  }

  //To dispose the stream:
  void _dispose() {
    _callStreamController.close();
  }


}