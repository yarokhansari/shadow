class LoginModel {
  final bool? token;
  final String? message;
  final Data? data;

  LoginModel({
    this.token,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : token = json['token'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'token': token, 'message': message, 'data': data?.toJson()};
}

class Data {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? name;
  final String? gender;
  final String? dateOfBirth;
  final String? phone;
  final String? status;
  final Group? group;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.status,
    this.group,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        email = json['email'] as String?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        name = json['name'] as String?,
        gender = json['gender'] as String?,
        dateOfBirth = json['date_of_birth'] as String?,
        phone = json['phone'] as String?,
        status = json['status'] as String?,
        group = (json['group'] as Map<String, dynamic>?) != null
            ? Group.fromJson(json['group'] as Map<String, dynamic>)
            : null,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'name': name,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        'phone': phone,
        'status': status,
        'group': group?.toJson(),
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class Group {
  final int? id;
  final String? name;
  final dynamic createdAt;
  final dynamic updatedAt;

  Group({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
