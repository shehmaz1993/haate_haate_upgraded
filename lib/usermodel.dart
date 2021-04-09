
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {


  String username;
  String password;
 // String password2;
 // String sendOtp;
 // String isPhoneVerified;
 // String otp;
  String token;
  User({
    this.username,
    this.password,
   // this.password2,
  //  this.sendOtp,
  //  this.isPhoneVerified,
 //   this.otp,
    this.token
  });

  factory User.fromJson(Map<String, String> map) => User(
    username: map["username"],
    password: map["password"],
   // password2: json["password2"],
  //  sendOtp: json["send_otp"],
  //  isPhoneVerified: json["is_phone_verified"],

    token: map["token"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    //"password2": password2,
    //"send_otp": sendOtp,
    //"is_phone_verified": isPhoneVerified,
    //"otp": otp,
    "token": token
  };

}
