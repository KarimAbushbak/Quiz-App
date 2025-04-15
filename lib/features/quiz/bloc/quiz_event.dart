abstract class QuizEvent {}

class LoadQuestionsByCategory extends QuizEvent {
  final String category;
  LoadQuestionsByCategory(this.category);
}
class NextQuestion extends QuizEvent {}

class PreviousQuestion extends QuizEvent {}

class AnswerQuestion extends QuizEvent {
  final int selectedIndex;
  AnswerQuestion(this.selectedIndex);
}

