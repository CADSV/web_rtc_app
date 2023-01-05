//Flutter imports:
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_webrtc_wrapper/flutter_webrtc_wrapper.dart';
import 'package:web_rtc_app/infrastructure/ui/styles/colors.dart';


//Project imports:



///RemoteConnectionComponent: Class that manages the remote connection.
class RemoteConnectionComponent extends StatefulWidget {

  final RTCVideoRenderer remoteRenderer;
  final Connection connection;

  RemoteConnectionComponent({
    required this.remoteRenderer,
    required this.connection,
    });

  @override
  _RemoteConnectionComponentState createState() => _RemoteConnectionComponentState();
}

class _RemoteConnectionComponentState extends State<RemoteConnectionComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: RTCVideoView(
            widget.remoteRenderer,
            mirror: false,
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          ),
        ),
        Container(
          color: widget.connection.videoEnabled! ? Colors.transparent : Colors.blueGrey[900],
          child: Text(
            widget.connection.videoEnabled! ? '' : widget.connection.name!,
            style: const TextStyle(
              color: colorWhite,
              fontSize: 30,
            ),
          )
        ),
        Positioned(
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.all(5),
            color: colorBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.connection.name!,
                  style: const TextStyle(fontSize: 15, color: colorWhite),
                ),
                Icon(
                  widget.connection.audioEnabled! ? Icons.mic : Icons.mic_off,
                  color: colorWhite,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}