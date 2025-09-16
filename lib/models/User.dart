class User {
  final int id;
  final String name;
  final String mail;
  final String phone;
  final DateTime dateBirth;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.mail,
    required this.phone,
    required this.dateBirth,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      mail: json["mail"],
      phone: json["phone"],
      dateBirth: json["dateBirth"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "mail": mail,
      "phone": phone,
      "dateBirth": dateBirth,
      "password": password,
    };
  }
}
