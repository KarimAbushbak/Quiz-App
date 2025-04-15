import '../data/question_model.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Question> questions;
  final int currentIndex;
  final int? selectedIndex;
  final bool answered;
  final int correctCount;


  QuizLoaded(
      this.questions, {
        this.currentIndex = 0,
        this.selectedIndex,
        this.answered = false,
        this.correctCount = 0,
      });
}

class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}
