// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.fcmToken,
    this.email,
    this.password,
    this.name,
    this.fullname,
    this.phone,
    this.address,
    this.username,
    this.image,
  });

  String? userId;
  String? fcmToken;
  String? email;
  String? password;
  String? name;
  String? fullname;
  String? phone;
  String? address;
  String? username;
  String? image;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    fcmToken: json["fcm_token"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    fullname: json["fullname"],
    phone: json["phone"],
    address: json["address"],
    username: json["username"],
    image: json["image"],
  );

  factory UserModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => UserModel(
    userId: json["user_id"],
    fcmToken: json["fcm_token"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    fullname: json["fullname"],
    phone: json["phone"],
    address: json["address"],
    username: json["username"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fcm_token": fcmToken,
    "email": email,
    "password": password,
    "name": name,
    "fullname": fullname,
    "phone": phone,
    "address": address,
    "username": username,
    "image": image,
  };
}
