class User{
  final int id;
  final String name;
  final String mail;
  final String phone;
  final DateTime dateBirth;
  final password;

  const User({
    required this.id,
    required this.name,
    required this.mail,
    required this.phone,
    required this.dateBirth,
    required this.password
  });
}