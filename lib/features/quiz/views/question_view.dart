import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes.dart';
import '../bloc/quiz_bloc.dart';
import '../bloc/quiz_event.dart';
import '../bloc/quiz_state.dart';

class QuestionPage extends StatelessWidget {
  final String category;

  const QuestionPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              category,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "30 Questions",
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            final question = state.questions[state.currentIndex];

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Question ${state.currentIndex + 1} of ${state.questions.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  height: 430,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question.questions,
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      ...question.options.asMap().entries.map((entry) {
                        final index = entry.key;
                        final option = entry.value.toUpperCase();

                        final isCorrect = index == question.correctIndex;
                        final isSelected = index == state.selectedIndex;

                        Color backgroundColor = Colors.white;

                        if (state.answered) {
                          if (isSelected && isCorrect) {
                            backgroundColor = const Color(0xFF0F469A); // Blue
                          } else if (isSelected && !isCorrect) {
                            backgroundColor = Colors.red; // Wrong
                          }
                        }

                        return GestureDetector(
                          onTap: state.answered
                              ? null
                              : () {
                                  context
                                      .read<QuizBloc>()
                                      .add(AnswerQuestion(index));
                                },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: double.infinity,
                            height: 58,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                option,
                                style: TextStyle(
                                  color: state.answered && isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 78,
                        height: 34,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0F469A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: state.currentIndex > 0
                              ? () => context
                                  .read<QuizBloc>()
                                  .add(PreviousQuestion())
                              : null,
                          child: const Text("Back",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 12), // space between buttons
                      SizedBox(
                        width: 78,
                        height: 34,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F469A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (state.currentIndex <
                                state.questions.length - 1) {
                              context.read<QuizBloc>().add(NextQuestion());
                            } else {
                              final correctCount =
                                  (state as QuizLoaded).correctCount;

                              Navigator.pushNamed(
                                context,
                                Routes.resultPage,
                                arguments: correctCount,
                              );
                            }
                          },
                          child: Text(
                            state.currentIndex < state.questions.length - 1
                                ? "Next"
                                : "Finish",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is QuizError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
