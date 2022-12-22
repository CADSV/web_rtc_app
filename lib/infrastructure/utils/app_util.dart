//Package import
import 'package:flutter/material.dart';

//Project imports:
import 'package:web_rtc_app/infrastructure/ui/components/dialog_component.dart';


///AppUtil: This class is used to manage the app utility.
class AppUtil{

  static Future<void> showDialogUtil({required BuildContext context, String? title, required String message}) async {

    await showDialog(
        context: context,
        builder: (BuildContext context) => DialogComponent(
          textTitle: title,
          textQuestion: message,
        ));

  }
}