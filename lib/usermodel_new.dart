
import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.pendingResponse,
  });

  PendingResponse pendingResponse;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
    pendingResponse: PendingResponse.fromJson(json["pending_response"]),
  );

  Map<String, dynamic> toJson() => {
    "pending_response": pendingResponse.toJson(),
  };
}

class PendingResponse {
  PendingResponse({
    this.sms,
  });

  Sms sms;

  factory PendingResponse.fromJson(Map<String, dynamic> json) => PendingResponse(
    sms: Sms.fromJson(json["sms"]),
  );

  Map<String, dynamic> toJson() => {
    "sms": sms.toJson(),
  };
}

class Sms {
  Sms({
    this.username,
    this.otp,
    this.isPhoneVerified,
  });

  String username;
  String otp;
  String isPhoneVerified;

  factory Sms.fromJson(Map<String, dynamic> json) => Sms(
    username: json["username"],
    otp: json["otp"],
    isPhoneVerified: json["is_phone_verified"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "otp": otp,
    "is_phone_verified": isPhoneVerified,
  };
}
