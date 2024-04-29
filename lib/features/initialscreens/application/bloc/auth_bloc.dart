import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo = AuthRepo();
  AuthBloc() : super(AuthInitial()) {
    on<GoogleLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepo.signInWithGoogle();
        emit(AuthLoggedIn());
      } catch (e) {
        emit(AuthError());
      }
    });
  }
}
