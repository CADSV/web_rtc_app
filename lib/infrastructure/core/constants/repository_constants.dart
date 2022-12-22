///RepositorysConstant: Enum for repositories methods.
enum RepositoryConstant {
  contentType,
  operationGet,
  operationPost,
  operationPut,
  operationDelete,
}


extension RepositoryConstantExtension on RepositoryConstant {
  String get key {
    switch (this) {
      case RepositoryConstant.contentType:
        return 'application/json';
      case RepositoryConstant.operationGet:
        return 'get';
      case RepositoryConstant.operationPost:
        return 'post';
      case RepositoryConstant.operationPut:
        return 'put';
      case RepositoryConstant.operationDelete:
        return 'delete';
    }
  }
}

enum RepositoryParameterPathConstant {
  example
}

extension RepositoryParameterPathConstantExtension on RepositoryParameterPathConstant {
  String get path {
    switch (this) {
      case RepositoryParameterPathConstant.example:
        return '{example}';

    }
  }
}


///RepositoryPathConstant: Enum for endpoints path.
enum RepositoryPathConstant {
  wssToken,
  getUserToken
}

extension RepositoryPathConstantExtension on RepositoryPathConstant {
  String get path {
    switch (this) {

      case RepositoryPathConstant.wssToken:
        return 'Token SuperSecretToken';

      case RepositoryPathConstant.getUserToken:
        return 'token/';

    }
  }
}


