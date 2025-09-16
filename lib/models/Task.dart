enum Categorys{
  TRABALHO,
  ESTUDO,
  LAZER,
  VIAGENS,
  FAMILIA,
  APOSENTADORIA
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
    required this.isCheck
  });
}