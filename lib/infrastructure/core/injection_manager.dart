//Flutter imports
import 'package:get_it/get_it.dart';

//Project imports
import 'package:web_rtc_app/infrastructure/core/context_manager.dart';
import 'package:web_rtc_app/infrastructure/core/navigator_manager.dart';
import 'package:web_rtc_app/infrastructure/core/repository_manager.dart';


//Global constants
final getIt = GetIt.instance;


///InjectionManager: Class that manages the injection of the application.
class InjectionManager {
  static Future<void> setupInjections() async {
    getIt.registerSingleton<ContextManager>(ContextManager());
    getIt.registerSingleton<RepositoryManager>(RepositoryManager());

    NavigatorServiceContract.inject();


    //USE CASES INJECTION
  }
}