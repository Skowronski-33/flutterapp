class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String createdAt;

  // Use 'required' para garantir que todos os campos sejam fornecidos
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      createdAt: json['createdAt'],
    );
  }

  //converte um UserModel em um Map (json)
  static Map<String, dynamic> toJson(UserModel userModel) {
    Map<String, dynamic> json = {
      'name': userModel.name,
      'email': userModel.email,
      'avatar': userModel.avatar,
    };
    return json;
  }
}
