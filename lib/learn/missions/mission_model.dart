// To parse this JSON data, do
//
//     final missions = missionsFromJson(jsonString);

import 'dart:convert';

List<Missions> missionsFromJson(String str) =>
    List<Missions>.from(json.decode(str).map((x) => Missions.fromJson(x)));

String missionsToJson(List<Missions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Missions {
  Missions({
    this.missionName,
    this.missionId,
    this.manufacturers,
    this.payloadIds,
    this.wikipedia,
    this.website,
    this.twitter,
    this.description,
  });

  String missionName;
  String missionId;
  List<String> manufacturers;
  List<String> payloadIds;
  String wikipedia;
  String website;
  String twitter;
  String description;

  factory Missions.fromJson(Map<String, dynamic> json) => Missions(
        missionName: json["mission_name"],
        missionId: json["mission_id"],
        manufacturers: List<String>.from(json["manufacturers"].map((x) => x)),
        payloadIds: List<String>.from(json["payload_ids"].map((x) => x)),
        wikipedia: json["wikipedia"],
        website: json["website"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "mission_name": missionName,
        "mission_id": missionId,
        "manufacturers": List<dynamic>.from(manufacturers.map((x) => x)),
        "payload_ids": List<dynamic>.from(payloadIds.map((x) => x)),
        "wikipedia": wikipedia,
        "website": website,
        "twitter": twitter == null ? null : twitter,
        "description": description,
      };
}
