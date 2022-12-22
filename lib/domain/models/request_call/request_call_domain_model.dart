//Package imports
import 'dart:convert';

RequestCallDomainModel requestCallDomainModelFromJson(String str) => RequestCallDomainModel.fromJson(json.decode(str));

String requestCallDomainModelToJson(RequestCallDomainModel data) => json.encode(data.toJson());


class RequestCallDomainModel{

  String userId;
  String meeting;
  String username;
  String password;

  RequestCallDomainModel({
    required this.userId,
    required this.meeting,
    required this.username,
    required this.password,
  });

  factory RequestCallDomainModel.fromJson(Map<String, dynamic> json) => RequestCallDomainModel(
    userId: json["user_id"],
    meeting: json["meeting"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "meeting": meeting,
    "username": username,
    "password": password,
  };

}