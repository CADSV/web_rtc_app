//Package imports:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project imports
import 'package:web_rtc_app/infrastructure/core/navigator_manager.dart';
import 'package:web_rtc_app/infrastructure/utils/app_util.dart';
part 'request_call_event.dart';
part 'request_call_state.dart';


///RequestCallBloc: Here we would have the RequestCall domain logic.
class RequestCallBloc extends Bloc<RequestCallEvent, RequestCallState> {

  //Here the StreamController can be a state or a DomainModel
  final _loginStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();


 //Constructor
  //You have to declare the StateInitial as the first state
  RequestCallBloc() : super(RequestCallStateInitial()) {
    on<RequestCallEventFetchBasicData>(_fetchBasicRequestCallDataEventToState);
    on<RequestCallEventNavigateToWith>(_navigateToEventToState);

  }


  //Variables:


  //Getters


  //Setters


  //Methods:

  ///This method is called when the event is [RequestCallEventFetchBasicData]
  ///It fetches the basic data of the RequestCall page.
  void _fetchBasicRequestCallDataEventToState(RequestCallEvent event, Emitter<RequestCallState> emit) async {

    emit(RequestCallStateLoading());



    _loadView();
    emit(RequestCallStateHideLoading());
  }


  ///This method is called when the event is [RequestCallEventNavigateTo]
  ///It navigates to the specified page.
  void _navigateToEventToState(RequestCallEventNavigateToWith event, Emitter<RequestCallState> emit) {
     _dispose(); //TODO: Dispose cuando se navegue a main
    _navigatorManager.navigateTo(event.routeName);
  }






  //Private methods:


  //To load the view:
  void _loadView() => _loginStreamController.sink.add(true);


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
    _loginStreamController.close();
  }


}