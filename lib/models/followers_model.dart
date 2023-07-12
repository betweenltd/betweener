// To parse this JSON data, do
//
//     final followersModel = followersModelFromJson(jsonString);

import 'dart:convert';

FollowersModel followersModelFromJson(String str) =>
    FollowersModel.fromJson(json.decode(str));

String followersModelToJson(FollowersModel data) => json.encode(data.toJson());

class FollowersModel {
  int followingCount;
  int followersCount;
  List<Follow> following;
  List<Follow> followers;

  FollowersModel({
    required this.followingCount,
    required this.followersCount,
    required this.following,
    required this.followers,
  });

  factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
        followingCount: json["following_count"],
        followersCount: json["followers_count"],
        following:
            List<Follow>.from(json["following"].map((x) => Follow.fromJson(x))),
        followers:
            List<Follow>.from(json["followers"].map((x) => Follow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "following_count": followingCount,
        "followers_count": followersCount,
        "following": List<dynamic>.from(following.map((x) => x.toJson())),
        "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
      };
}

class Follow {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String createdAt;
  String updatedAt;
  int isActive;
  dynamic country;
  dynamic ip;
  double? long;
  double? lat;
  String? fcm;

  Follow({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.fcm,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isActive: json["isActive"],
        country: json["country"],
        ip: json["ip"],
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        fcm: json["fcm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "isActive": isActive,
        "country": country,
        "ip": ip,
        "long": long,
        "lat": lat,
        "fcm": fcm,
      };
}
