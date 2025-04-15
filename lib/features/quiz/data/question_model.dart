class Question {
  final int id;
  final String questions;
  final List<String> options;
  final int correctIndex;
  final String category;

  Question({
    required this.id,
    required this.questions,
    required this.options,
    required this.correctIndex,
    required this.category,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      questions: map['questions'],
      options: List<String>.from(map['options']),
      correctIndex: map['correct_index'],
      category: map['category'],
    );
  }
}
