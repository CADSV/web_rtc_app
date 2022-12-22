//Package imports:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_rtc_app/application/use_cases/user_token/get_user_token_use_case.dart';
import 'package:web_rtc_app/domain/models/request_call/request_call_domain_model.dart';
import 'package:web_rtc_app/domain/models/user_token/get_user_token_domain_model.dart';
import 'package:web_rtc_app/domain/models/user_token/user_token_domain_model.dart';

//Project imports
import 'package:web_rtc_app/infrastructure/core/navigator_manager.dart';
import 'package:web_rtc_app/infrastructure/utils/app_util.dart';
part 'request_call_event.dart';
part 'request_call_state.dart';


///RequestCallBloc: Here we would have the RequestCall domain logic.
class RequestCallBloc extends Bloc<RequestCallEvent, RequestCallState> {

  //Here the StreamController can be a state or a DomainModel
  final _requestCallStreamController = StreamController<bool>();

  //Instances of use cases:
  final NavigatorServiceContract _navigatorManager = NavigatorServiceContract.get();
  final GetUserTokenUseCaseContract _getUserTokenUseCaseContract = GetUserTokenUseCaseContract.get();


 //Constructor
  //You have to declare the StateInitial as the first state
  RequestCallBloc() : super(RequestCallStateInitial()) {
    on<RequestCallEventFetchBasicData>(_fetchBasicRequestCallDataEventToState);
    on<RequestCallEventNavigateToWith>(_navigateToEventToState);
    on<RequestCallEventStartMeeting>(_startMeetingEventToState);

  }


  //Variables:


  //Getters
  Stream<bool> get streamRequestCall => _requestCallStreamController.stream;

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


  ///This method is called when the event is [RequestCallEventStartMeeting]
  ///It starts the meeting.
  void _startMeetingEventToState(RequestCallEventStartMeeting event, Emitter<RequestCallState> emit) async {

    emit(RequestCallStateLoading());



    var tokenResponse = await _getUserTokenUseCaseContract.run(_prepareGetUserTokenModel(event.requestCallDomainModel));

    if(tokenResponse != null) {
      var userToken = getUserTokenDomainModelFromJson(tokenResponse);
    }

    _loadView();

    emit(RequestCallStateHideLoading());

  }




  //Private methods:


  UserTokenDomainModel _prepareGetUserTokenModel(RequestCallDomainModel requestCallDomainModel) {
    return UserTokenDomainModel(
      userId: requestCallDomainModel.userId,
    );

  }


  //To load the view:
  void _loadView() => _requestCallStreamController.sink.add(true);


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
    _requestCallStreamController.close();
  }


}