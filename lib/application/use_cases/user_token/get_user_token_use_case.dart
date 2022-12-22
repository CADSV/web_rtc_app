//Project import:

import 'package:web_rtc_app/domain/models/user_token/user_token_domain_model.dart';
import 'package:web_rtc_app/infrastructure/core/injection_manager.dart';
import 'package:web_rtc_app/infrastructure/providers/queries/user/get_user_token_query_provider_contract.dart';

abstract class GetUserTokenUseCaseContract {
  static inject() => getIt.registerSingleton<GetUserTokenUseCaseContract>(
      _GetUserTokenUseCase());

  static GetUserTokenUseCaseContract get() => getIt<GetUserTokenUseCaseContract>();

  /// Providers
  GetUserTokenQueryProviderContract provider = GetUserTokenQueryProviderContract.inject();

  /// Methods
  Future<dynamic> run(UserTokenDomainModel userTokenDomainModel);
}




class _GetUserTokenUseCase extends GetUserTokenUseCaseContract {

  @override
  Future<dynamic> run(UserTokenDomainModel userTokenDomainModel) async {

    return provider.getUserToken(userTokenDomainModel);
  }
}
