//Package imports
import 'dart:convert';

GetUserTokenDomainModel getUserTokenDomainModelFromJson(String str) => GetUserTokenDomainModel.fromJson(json.decode(str));

String getUserTokenDomainModelToJson(GetUserTokenDomainModel data) => json.encode(data.toJson());


class GetUserTokenDomainModel{

  String token;

  GetUserTokenDomainModel({
    required this.token,
  });

  factory GetUserTokenDomainModel.fromJson(Map<String, dynamic> json) => GetUserTokenDomainModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };

}