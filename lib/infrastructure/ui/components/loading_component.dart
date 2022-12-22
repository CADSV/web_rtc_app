// Flutter imports:
import 'package:flutter/material.dart';

//Project imports:
import 'package:web_rtc_app/infrastructure/ui/components/base_ui_component.dart';
import 'package:web_rtc_app/infrastructure/ui/styles/colors.dart';


///LoadingComponent: A progress indicator widget.
class LoadingComponent extends StatelessWidget {

  const LoadingComponent({
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUIComponent(
      body: const Center(
          child: CircularProgressIndicator(
            value: null,
            strokeWidth: 4.0,
            color: colorPrimary,
          ),
      ),
    );
  }
}
