// To parse this JSON data, do
//
//     final followersModel = followersModelFromJson(jsonString);

import 'dart:convert';

FollowersModel followersModelFromJson(String str) =>
    FollowersModel.fromJson(json.decode(str));

String followersModelToJson(FollowersModel data) => json.encode(data.toJson());

class FollowersModel {
  int count;
  List<dynamic> followers;

  FollowersModel({
    required this.count,
    required this.followers,
  });

  factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
        count: json["count"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "followers": List<dynamic>.from(followers.map((x) => x)),
      };
}
