class Score {
  final int id;
  final String name;
  final int score;

  Score({required this.id, required this.name, required this.score});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'score': score};
  }
}
