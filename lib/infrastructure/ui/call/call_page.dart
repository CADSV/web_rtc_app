//Package imports:
// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


//Project imports:
import 'package:web_rtc_app/application/bloc/call/call_bloc.dart';
import 'package:web_rtc_app/domain/models/websockets/new_peer_domain_model.dart';
import 'package:web_rtc_app/infrastructure/ui/components/base_ui_component.dart';
import 'package:web_rtc_app/infrastructure/ui/components/loading_component.dart';
import 'package:web_rtc_app/infrastructure/ui/styles/colors.dart';



class CallPage extends StatefulWidget{
  String webSocketURL;

  static const routeName = '/call';

  CallPage({
    Key? key,
    required this.webSocketURL,
    }) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage>{

  var channel;


  @override
  Widget build(BuildContext context){

    channel = WebSocketChannel.connect(Uri.parse(widget.webSocketURL));

    return _page(context);

  }



  Widget _page(BuildContext context) {
    return BlocProvider(
      lazy:  false,
      create: (context) => CallBloc(),
      child: BlocBuilder<CallBloc, CallState>(
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
  Widget _body(BuildContext context, CallState state) {

    if(state is CallStateInitial) {
      context.read<CallBloc>().add(CallEventFetchBasicData());
    }

    return Stack(
      children: [
        if(state is! CallStateInitial)  _callStreamBuilder(context),
        if(state is CallStateInitial || state is CallStateLoading) const LoadingComponent(),
      ],
    );
  }


  //StreamBuilder for the Call Page
  Widget _callStreamBuilder(BuildContext builderContext) => StreamBuilder<bool>(
    stream: builderContext.read<CallBloc>().streamCall,
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {

      if(snapshot.hasData) {
        return _callRenderView(context);
      }

      return const LoadingComponent();
    }
  );


    //Widget to create the stack of fields
  Widget _callRenderView(BuildContext context) {

    return Column(
      children: [
        StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = newPeerDomainModelFromJson(snapshot.data.toString());
              return Text('Type es: ${data.type} y peer es: ${data.data.peer}');
            }
              return const Text('nothing');
          },
        ),
      ],
    );
  }


  void _sendMessage() {
    // if (_controller.text.isNotEmpty) {
    //   channel.sink.add(_controller.text);
    }


  // @override
  // void dispose() {
  //   channel.sink.close();
  //   super.dispose();
  // }


}