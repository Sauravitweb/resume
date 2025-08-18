import 'package:MyNotes/services/auth/auth_user.dart';
import 'package:flutter/foundation.dart ' show immutable;
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;

  const AuthState(
      {required this.isLoading, this.loadingText = 'Please Wait for a moment'});
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required isLoading})
      : super(isLoading: isLoading);
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering(
      {required super.isLoading, required this.exception});
}

class AuthStateForgotPassword extends AuthState {
  final Exception? exception;
  final bool hasSentEmail;
  const AuthStateForgotPassword({
    required this.exception,
    required this.hasSentEmail,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  const AuthStateLoggedIn({required super.isLoading, required this.user});
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({required super.isLoading});
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;

  const AuthStateLoggedOut({
    required this.exception,
    required bool isLoading,
    String? loadingText,
  }) : super(isLoading: isLoading, loadingText: loadingText);

  @override
  // TODO: implement props
  List<Object?> get props => [exception, isLoading];
}
