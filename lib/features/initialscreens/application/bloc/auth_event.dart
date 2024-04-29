part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class GoogleLoginEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
