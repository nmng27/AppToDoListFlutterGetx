enum Categorys {
  TRABALHO,
  ESTUDO,
  LAZER,
  VIAGENS,
  FAMILIA,
  APOSENTADORIA,
}

class Task {
  final int id;
  final String name;
  final Categorys category;
  final DateTime dateCreated;
  final bool isCheck;

  const Task({
    required this.id,
    required this.name,
    required this.category,
    required this.dateCreated,
    required this.isCheck,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      name: json["name"],
      category: Categorys.values.firstWhere(
        (c) => c.toString().split('.').last == json["category"],
        orElse: () => Categorys.TRABALHO,
      ),
      dateCreated: DateTime.parse(json["dateCreated"]),
      isCheck: json["isCheck"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "category": category.toString().split('.').last,
      "dateCreated": dateCreated.toIso8601String(),
      "isCheck": isCheck,
    };
  }
}
