class MeetingDetailDomainModel {

  String? id;
  String? hostId;
  String? hostName;

  MeetingDetailDomainModel({
    this.id,
    this.hostId,
    this.hostName,
  });


  factory MeetingDetailDomainModel.fromJson(dynamic json){
    return MeetingDetailDomainModel(
      id: json['id'],
      hostId: json['host_id'],
      hostName: json['host_name'],
    );
  }


}