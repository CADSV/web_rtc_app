
import 'package:web_rtc_app/domain/models/user_token/user_token_domain_model.dart';
import 'package:web_rtc_app/infrastructure/core/constants/repository_constants.dart';
import 'package:web_rtc_app/infrastructure/core/injection_manager.dart';
import 'package:web_rtc_app/infrastructure/core/repository_manager.dart';

///GetUserTokenQueryProviderContract: Interface that defines the methods that the GetUserTokenQueryProvider class must implement.
abstract class GetUserTokenQueryProviderContract {
  static GetUserTokenQueryProviderContract inject() => _GetUserTokenQueryProvider();

  Future<void> getUserToken(UserTokenDomainModel userTokenDomainModel);

}

enum GetUserTokenQueryProviderError {
  unauthorized,
  internalError,
}


class _GetUserTokenQueryProvider extends GetUserTokenQueryProviderContract {

  @override
  Future<dynamic> getUserToken(UserTokenDomainModel userTokenDomainModel) async {

    final response = await getIt<RepositoryManager>()
    .request(operation: RepositoryConstant.operationPost.key,
      endpoint: RepositoryPathConstant.getUserToken.path,
      body: userTokenDomainModel.toJson(),
      // header: {
      //   'Authorization': RepositoryPathConstant.wssToken.path
      // }
      )
    .catchError((onError) {

      return null;

    });

    return response;
  }
}