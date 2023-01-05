//Flutter imports:
// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

//Project imports:
import 'package:web_rtc_app/infrastructure/ui/components/reusable_widgets.dart';
import 'package:web_rtc_app/infrastructure/ui/styles/colors.dart';

///ControlPanelComponent: Class that manages the call control panel.
class ControlPanelComponent extends StatelessWidget{

  bool? videoEnabled;
  bool? audioEnabled;
  bool? isConnectionFailed;
  VoidCallback? onVideoToggle;
  VoidCallback? onAudioToggle;
  VoidCallback? onReconnect;
  VoidCallback? onMeetingEnd;

  ControlPanelComponent({
    this.videoEnabled,
    this.audioEnabled,
    this.isConnectionFailed,
    this.onVideoToggle,
    this.onAudioToggle,
    this.onReconnect,
    this.onMeetingEnd
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      height: MediaQuery.of(context).size.height *0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _renderBuildCallControls(context),
      ),
    );
  }


   List<Widget> _renderBuildCallControls(BuildContext context){

    if(!isConnectionFailed!){
      return <Widget> [
        IconButton(
          onPressed: onVideoToggle,
          icon: Icon(
            videoEnabled! ? Icons.videocam : Icons.videocam_off,
            color: colorWhite,
          ),
          iconSize: 32.0,
        ),
        IconButton(
          onPressed:onAudioToggle,
          icon: Icon(
            audioEnabled! ? Icons.mic : Icons.mic_off,
            color: colorWhite,
          ),
          iconSize: 32.0,
        ),
        widthSeparator(context, 0.05),
        Container(
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorError,
          ),
          child: IconButton(
            onPressed: onMeetingEnd,
            icon: const Icon(
              Icons.call_end,
              color: colorWhite,
            )
          ),
        )
      ];
    } else {
      return <Widget>[
        FormHelper.submitButton(
          "Reconnect",
          onReconnect!,
          btnColor: colorError,
          borderRadius: 10,
          width: 200,
          height: 40,
        )
      ];
    }
  }


  
}