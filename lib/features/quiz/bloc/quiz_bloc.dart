import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizie/features/quiz/bloc/progress_bloc.dart';
import '../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../data/quiz_repository.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository repository;
  final ProgressBloc progressBloc;

  QuizBloc(this.repository, this.progressBloc) : super(QuizInitial()) {
    on<LoadQuestionsByCategory>((event, emit) async {
      emit(QuizLoading());
      try {
        final questions =
            await repository.fetchQuestionsByCategory(event.category);
        emit(QuizLoaded(questions));
      } catch (e) {
        emit(QuizError("Failed to load questions"));
      }
    });

    on<NextQuestion>((event, emit) {
      if (state is QuizLoaded) {
        final current = state as QuizLoaded;
        final nextIndex = current.currentIndex + 1;
        if (nextIndex < current.questions.length) {
          emit(QuizLoaded(
            current.questions,
            currentIndex: nextIndex,
            selectedIndex: null,
            answered: false,
            correctCount: current.correctCount, // ✅ Preserve correct count
          ));
        }
      }
    });

    on<PreviousQuestion>((event, emit) {
      if (state is QuizLoaded) {
        final current = state as QuizLoaded;
        final prevIndex = current.currentIndex - 1;
        if (prevIndex >= 0) {
          emit(QuizLoaded(
            current.questions,
            currentIndex: prevIndex,
            answered: false,
            selectedIndex: null,
            correctCount: current.correctCount, // ✅ Preserve correct count
          ));
        }
      }
    });

    on<AnswerQuestion>((event, emit) async {
      if (state is QuizLoaded) {
        final current = state as QuizLoaded;
        final category = current.questions[current.currentIndex].category;
        final isCorrect = event.selectedIndex ==
            current.questions[current.currentIndex].correctIndex;

        int newCorrectCount = current.correctCount;
        if (!current.answered && isCorrect) {
          newCorrectCount++;
        }

        if (!current.answered) {
          await AppSettingsSharedPreferences().incrementAnswered(category);
          final answered =
              await AppSettingsSharedPreferences().getAnswered(category);

          progressBloc.add(ProgressEvent(category, answered)); // ✅ update Bloc
        }

        emit(QuizLoaded(
          current.questions,
          currentIndex: current.currentIndex,
          selectedIndex: event.selectedIndex,
          answered: true,
          correctCount: newCorrectCount, // ✅ pass updated count
        ));
      }
    });
  }
}
