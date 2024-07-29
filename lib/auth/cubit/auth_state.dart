part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  final bool isLogin;
  const AuthState(this.isLogin);
}

final class AuthInitial extends AuthState {
  const AuthInitial(super.isLogin);
}

final class AuthModChanged extends AuthState {
  const AuthModChanged(super.isLogin);
}

final class AuthLoading extends AuthState {
  const AuthLoading(super.isLogin);
}

final class AuthError extends AuthState {
  final String? message;
  const AuthError(super.isLogin, this.message);
}
