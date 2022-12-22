//Flutter imports
import 'package:flutter/material.dart';

//Project imports:
import 'package:web_rtc_app/infrastructure/ui/components/text_form_field_component.dart';


class TextFieldBaseComponent extends StatefulWidget {
  final String hintText;
  final String errorMessage;
  final int? minLength;
  final int maxLength;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isAmount;


  const TextFieldBaseComponent({Key? key, 
    required this.hintText,
    required this.errorMessage,
    this.minLength,
    required this.maxLength,
    required this.textEditingController,
    required this.keyboardType,
    this.obscureText = false,
    this.isAmount = false,

  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldBaseComponentState createState() =>
      _TextFieldBaseComponentState();
}

class _TextFieldBaseComponentState extends State<TextFieldBaseComponent> {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormFieldBaseComponent(
          hintText: widget.hintText,
          errorMessage: widget.errorMessage,
          minLength: widget.minLength?? 0,
          maxLength: widget.maxLength,
          textEditingController: widget.textEditingController,
          keyboardType: widget.keyboardType,
          isPassword: widget.obscureText,
          isAmount: widget.isAmount,
        )
      ],
    );
  }
}