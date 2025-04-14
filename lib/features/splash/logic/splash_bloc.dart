import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartSplash>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));

      emit(SplashNavigateToHome());
    });
  }
}
