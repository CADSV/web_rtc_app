//Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//Project imports:
import 'package:web_rtc_app/application/bloc/request_call/request_call_bloc.dart';
import 'package:web_rtc_app/infrastructure/core/constants/image_constants.dart';
import 'package:web_rtc_app/infrastructure/core/constants/min_max_constants.dart';
import 'package:web_rtc_app/infrastructure/core/constants/text_constants.dart';
import 'package:web_rtc_app/infrastructure/core/context_manager.dart';
import 'package:web_rtc_app/infrastructure/core/injection_manager.dart';
import 'package:web_rtc_app/infrastructure/ui/components/base_ui_component.dart';
import 'package:web_rtc_app/infrastructure/ui/components/button_component.dart';
import 'package:web_rtc_app/infrastructure/ui/components/loading_component.dart';
import 'package:web_rtc_app/infrastructure/ui/components/reusable_widgets.dart';
import 'package:web_rtc_app/infrastructure/ui/components/text_field_component.dart';
import 'package:web_rtc_app/infrastructure/ui/styles/colors.dart';



class RequestCallPage extends StatelessWidget {

  static const routeName = '/requestCall';

  RequestCallPage({Key? key}) : super(key: key);


  //Controllers

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _textUserNameController = TextEditingController(text: '');
  final TextEditingController _textUUIDCallController = TextEditingController(text: '');
  final TextEditingController _textPeerIDController = TextEditingController(text: '');
  final TextEditingController _textPeerPasswordController = TextEditingController(text: '');




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy:  false,
      create: (context) => RequestCallBloc(),
      child: BlocBuilder<RequestCallBloc, RequestCallState>(
        builder: (context, state) {

          return BaseUIComponent(
            appBar: _renderAppBar(context),
            body: _body(context, state),
            bottomNavigationBar: _renderBottomNavigationBar(context),
          );
        },
      ),
    );
  }


  ///Widget AppBar
  PreferredSizeWidget _renderAppBar(BuildContext context) => AppBar( backgroundColor: colorPrimary);


  //Widget Bottom Navigation Bar
  Widget _renderBottomNavigationBar(BuildContext context) => 
    Container(width: double.infinity, height: MediaQuery.of(context).size.height * 0.05, color: colorSecondary);

  //Widget Body
  Widget _body(BuildContext context, RequestCallState state) {

    if(state is RequestCallStateInitial) {
      context.read<RequestCallBloc>().add(RequestCallEventFetchBasicData());
    }

    return Stack(
      children: [
        if(state is! RequestCallStateInitial)  _requestCallStreamBuilder(context),
        if(state is RequestCallStateInitial || state is RequestCallStateLoading) const LoadingComponent(),
      ],
    );
  }


  //StreamBuilder for the RequestCall Page
  Widget _requestCallStreamBuilder(BuildContext builderContext) => StreamBuilder<bool>(
    stream: builderContext.read<RequestCallBloc>().streamRequestCall,
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {

      if(snapshot.hasData) {
        return _requestCallRenderView(context);
      }

      return const LoadingComponent();
    }
  );


    //Widget to create the stack of fields
  Widget _requestCallRenderView(BuildContext context) {

    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: generalMarginView,
              child: Container(
                child: _createRequestCallFields(context)
              ),
            ),
          ),
        ),
      ],
    );
  }


//Widget to create the fields 
  Widget _createRequestCallFields(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment:  CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      renderLogoImageView(context, imagePath: ImagesConstant.webRTC.imagePath),
      heightSeparator(context, 0.025),
      _renderUserNameTextField(),
      heightSeparator(context, 0.025),
      _renderUUIDCallTextField(),
      heightSeparator(context, 0.025),
      _renderPeerIdTextField(),
      heightSeparator(context, 0.025),
      _renderPeerPasswordTextField(),
      heightSeparator(context, 0.025),
      _renderButtons(context),
    ],
  );


  Widget _renderUserNameTextField() => TextFieldBaseComponent(
    hintText: 'Username',
    errorMessage: 'Please enter the username',
    minLength: MinMaxConstant.minLengthUserName.value,
    maxLength: MinMaxConstant.maxLengthUserName.value,
    textEditingController: _textUserNameController,
    keyboardType: TextInputType.text,
  );

  Widget _renderUUIDCallTextField() => TextFieldBaseComponent(
    hintText: 'Meeting UUID',
    errorMessage: 'Please enter the Meeting UUID',
    minLength: MinMaxConstant.minLengthPassword.value,
    maxLength: MinMaxConstant.maxLengthPassword.value,
    textEditingController: _textUUIDCallController,
    keyboardType: TextInputType.text,
  );

    Widget _renderPeerIdTextField() => TextFieldBaseComponent(
    hintText: 'Peer ID',
    errorMessage: 'Please enter the peer ID',
    minLength: MinMaxConstant.minLengthPassword.value,
    maxLength: MinMaxConstant.minLengthPassword.value,
    textEditingController: _textPeerIDController,
    keyboardType: TextInputType.text,
  );

    Widget _renderPeerPasswordTextField() => TextFieldBaseComponent(
    hintText: 'Peer Password',
    errorMessage: 'Please enter the peer password',
    minLength: MinMaxConstant.minLengthPassword.value,
    maxLength: MinMaxConstant.minLengthPassword.value,
    textEditingController: _textPeerPasswordController,
    keyboardType: TextInputType.text,
  );


  Widget _renderButtons(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 5),
    child: Center(
      child: Column(
        children: [
          _renderJoingMeetingButton(context),
        ],
        )
      )
    );


  Widget _renderJoingMeetingButton(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 5),
    width: double.infinity,
    child:  ButtonComponent(
      title: TextConstant.joinMeeting.text,
      actionButton:  () => _joinMeeting(context),
    )
  );






  void _joinMeeting(BuildContext context) {

    getIt<ContextManager>().context = context;

    if(_formKey.currentState?.validate() ?? false) {
      context.read<RequestCallBloc>().add(RequestCallEventStartMeeting());
    }

  }




}