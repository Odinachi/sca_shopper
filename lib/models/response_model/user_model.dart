class UserModel {
  final String? email;
  final String? password;
  final String? name;
  final String? avatar;
  final String? role;
  final int? id;

  UserModel({
    this.email,
    this.password,
    this.name,
    this.avatar,
    this.role,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
        "role": role,
        "id": id,
      };
}
