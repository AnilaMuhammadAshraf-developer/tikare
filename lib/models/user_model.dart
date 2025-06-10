class UserModel {
  int? id;
  String? role;
  String? name;
  String? lastName;
  String? profileImage;
  String? email;
  String? emailOtp;
  Null? emailVerifiedAt;
  String? phone;
  Null? isocode;
  Null? countryCode;
  String? location;
  int? isProfileCompleted;
  int? isPushNotify;
  String? deviceType;
  String? deviceToken;
  Null? socialType;
  Null? socialToken;
  int? isBlocked;
  String? customerId;
  Null? accountNum;
  Null? redirectUrl;
  int? merchantAccount;
  int? isSubscribed;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Null? lat;
  Null? lng;
 

  UserModel(
      {this.id,
      this.role,
      this.name,
      this.lastName,
      this.profileImage,
      this.email,
      this.emailOtp,
      this.emailVerifiedAt,
      this.phone,
      this.isocode,
      this.countryCode,
      this.location,
      this.isProfileCompleted,
      this.isPushNotify,
      this.deviceType,
      this.deviceToken,
      this.socialType,
      this.socialToken,
      this.isBlocked,
      this.customerId,
      this.accountNum,
      this.redirectUrl,
      this.merchantAccount,
      this.isSubscribed,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.lat,
      this.lng,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    email = json['email'];
    emailOtp = json['email_otp'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    isocode = json['isocode'];
    countryCode = json['country_code'];
    location = json['location'];
    isProfileCompleted = json['is_profile_completed'];
    isPushNotify = json['is_push_notify'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    socialType = json['social_type'];
    socialToken = json['social_token'];
    isBlocked = json['is_blocked'];
    customerId = json['customer_id'];
    accountNum = json['account_num'];
    redirectUrl = json['redirect_url'];
    merchantAccount = json['merchant_account'];
    isSubscribed = json['is_subscribed'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lat = json['lat'];
    lng = json['lng'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['email'] = this.email;
    data['email_otp'] = this.emailOtp;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['isocode'] = this.isocode;
    data['country_code'] = this.countryCode;
    data['location'] = this.location;
    data['is_profile_completed'] = this.isProfileCompleted;
    data['is_push_notify'] = this.isPushNotify;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['social_type'] = this.socialType;
    data['social_token'] = this.socialToken;
    data['is_blocked'] = this.isBlocked;
    data['customer_id'] = this.customerId;
    data['account_num'] = this.accountNum;
    data['redirect_url'] = this.redirectUrl;
    data['merchant_account'] = this.merchantAccount;
    data['is_subscribed'] = this.isSubscribed;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
   
    return data;
  }
}
