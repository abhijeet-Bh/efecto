part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoggedIn extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthError extends AuthState {
  @override
  List<Object> get props => [];
}
