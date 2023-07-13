// To parse this JSON data, do
//
//     final nearestUsersModel = nearestUsersModelFromJson(jsonString);

import 'dart:convert';

NearestUsersModel nearestUsersModelFromJson(String str) =>
    NearestUsersModel.fromJson(json.decode(str));

String nearestUsersModelToJson(NearestUsersModel data) =>
    json.encode(data.toJson());

class NearestUsersModel {
  int count;
  List<NearestUser> nearestUsers;

  NearestUsersModel({
    required this.count,
    required this.nearestUsers,
  });

  factory NearestUsersModel.fromJson(Map<String, dynamic> json) =>
      NearestUsersModel(
        count: json["count"],
        nearestUsers: List<NearestUser>.from(
            json["nearest-users"].map((x) => NearestUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "nearest-users":
            List<dynamic>.from(nearestUsers.map((x) => x.toJson())),
      };
}

class NearestUser {
  int id;
  int userId;
  String type;
  String createdAt;
  String updatedAt;
  double distance;
  User user;

  NearestUser({
    required this.id,
    required this.userId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.distance,
    required this.user,
  });

  factory NearestUser.fromJson(Map<String, dynamic> json) => NearestUser(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        distance: json["distance"]?.toDouble(),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "distance": distance,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String createdAt;
  String updatedAt;
  int isActive;
  dynamic country;
  dynamic ip;
  double long;
  double lat;
  String? fcm;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    this.country,
    this.ip,
    required this.long,
    required this.lat,
    this.fcm,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
