//Package imports
import 'dart:convert';

UserTokenDomainModel userTokenDomainModelFromJson(String str) => UserTokenDomainModel.fromJson(json.decode(str));

String userTokenDomainModelToJson(UserTokenDomainModel data) => json.encode(data.toJson());


class UserTokenDomainModel{

  String userId;

  UserTokenDomainModel({
    required this.userId,
  });

  factory UserTokenDomainModel.fromJson(Map<String, dynamic> json) => UserTokenDomainModel(
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
  };

}