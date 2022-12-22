//Flutter importsWW
import 'package:flutter/material.dart';

//Project imports
import 'package:web_rtc_app/infrastructure/core/context_manager.dart';
import 'package:web_rtc_app/infrastructure/core/flavor_manager.dart';
import 'package:web_rtc_app/infrastructure/core/injection_manager.dart';
import 'package:web_rtc_app/infrastructure/core/navigator_manager.dart';
import 'package:web_rtc_app/infrastructure/core/routes_manager.dart';
import 'package:web_rtc_app/infrastructure/ui/components/loading_component.dart';
import 'package:web_rtc_app/infrastructure/ui/styles/theme.dart';
import 'package:web_rtc_app/infrastructure/utils/device_util.dart';

//This the main function of the app.
void main() async {

  await InjectionManager.setupInjections(); //Here we setup the injections

  FlavorManager.make(Flavor.DEV); //Here we set the flavor5 that we want to use.

  runApp(const WebRTCApp());
}

class WebRTCApp extends StatelessWidget {
  const WebRTCApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    getIt<ContextManager>().context = context;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorServiceContract.get().navigatorKey,
      theme: mainTheme(),
      onGenerateRoute: (
        RouteSettings settings,
      ) => RoutesManager.getOnGenerateRoute(settings, arguments: settings.arguments),
      home: const MyApp(),
    );
  }


}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return _checkInternet();

}

  Widget _checkInternet() {
    return FutureBuilder(
      future: DeviceUtil.checkInternetConnection(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return Container();

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!) {
            return Container(); 
          } else {
            return const LoadingComponent();
            // return NoInternetPage();
          }
        } else {
          return const LoadingComponent();
        }
      },
    );
  }

}