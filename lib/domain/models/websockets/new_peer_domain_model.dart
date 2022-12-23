//Package imports
import 'dart:convert';

NewPeerDomainModel newPeerDomainModelFromJson(String str) => NewPeerDomainModel.fromJson(json.decode(str));

String newPeerDomainModelToJson(NewPeerDomainModel data) => json.encode(data.toJson());


class NewPeerDomainModel{

  String type;
  NewPeerData data;

  NewPeerDomainModel({
    required this.type,
    required this.data,
  });

  factory NewPeerDomainModel.fromJson(Map<String, dynamic> json) => NewPeerDomainModel(
    type: json["type"],
    data: NewPeerData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": data.toJson(),
  };

}


class NewPeerData {

  String userId;
  String peer;
  String channelName;

  NewPeerData({
    required this.userId,
    required this.peer,
    required this.channelName,
  });

  factory NewPeerData.fromJson(Map<String, dynamic> json) => NewPeerData(
    userId: json["user_id"],
    peer: json["peer"],
    channelName: json["channel_name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "peer": peer,
    "channel_name": channelName,
  };

}