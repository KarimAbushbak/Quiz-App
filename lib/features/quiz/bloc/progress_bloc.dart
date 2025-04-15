// progress_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

/// ----------------------------
/// Progress Event
/// ----------------------------
class ProgressEvent {
  final String category;
  final int answered;

  ProgressEvent(this.category, this.answered);
}

/// ----------------------------
/// Progress State
/// ----------------------------
class ProgressState {
  final Map<String, int> answeredByCategory;

  ProgressState(this.answeredByCategory);
}

/// ----------------------------
/// Progress Bloc
/// ----------------------------
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressState({})) {
    on<ProgressEvent>((event, emit) {
      final updated = Map<String, int>.from(state.answeredByCategory);
      updated[event.category] = event.answered;
      emit(ProgressState(updated));
    });
  }
}
