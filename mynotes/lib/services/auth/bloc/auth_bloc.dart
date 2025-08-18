import 'package:MyNotes/services/auth/auth_provider.dart';
import 'package:MyNotes/services/auth/bloc/auth_event.dart';
import 'package:MyNotes/services/auth/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(
          const AuthStateUninitialized(isLoading: true),
        ) {
    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(
        isLoading: false,
        exception: null,
      ));
    });
    //Forgot Password

    on<AuthEventFotgotPassword>((event, emit) async {
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: false,
      ));
      final email = event.email;
      if (email == null) {
        return; //user just wants to go to forgot-password screen
      }

      //user wants to actually send a forgot-password email
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: true,
      ));
      bool didSendEmail;
      Exception? exception;

      try {
        await provider.sendPasswordReset(toEmail: email);
        didSendEmail = true;
        exception = null;
      } on Exception catch (e) {
        didSendEmail = false;
        exception = e;
      }

      emit(AuthStateForgotPassword(
        exception: exception,
        hasSentEmail: didSendEmail,
        isLoading: false,
      ));
    });
    //send email verification

    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });
    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      try {
        await provider.createUser(
          email: email,
          password: password,
        );
        await provider.sendEmailVerification();
        emit(const AuthStateNeedsVerification(isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateRegistering(exception: e, isLoading: false));
      }
    });
    // initialize
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(const AuthStateLoggedOut(
            isLoading: false,
            exception: null,
            loadingText: 'Please wait while I log you in'));
      } else if (!user.isEmailVerified) {
        emit(const AuthStateNeedsVerification(isLoading: false));
      } else {
        AuthStateLoggedIn(
          user: user,
          isLoading: false,
        );
      }
    });

    // login
    on<AuthEventLogIn>((event, emit) async {
      emit(const AuthStateLoggedOut(
          isLoading: true,
          exception: null,
          loadingText: 'Please wait while I log you in'));
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(
          email: email,
          password: password,
        );
        if (!user.isEmailVerified) {
          emit(
            const AuthStateLoggedOut(
                isLoading: false, loadingText: 'loading>>>', exception: null),
          );
          emit(
            const AuthStateNeedsVerification(isLoading: false),
          );
        } else {
          emit(
            const AuthStateLoggedOut(
                isLoading: false, loadingText: 'loading>>>', exception: null),
          );
          emit(AuthStateLoggedIn(user: user, isLoading: false));
        }
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(
            isLoading: false, loadingText: 'loading>>>', exception: e));
      }
    });

    // log Out
    on<AuthEventLogOut>((event, emit) async {
      try {
        await provider.logOut();
        emit(const AuthStateLoggedOut(
            isLoading: false,
            exception: null,
            loadingText: 'Please wait while I log you in'));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(
            isLoading: false,
            exception: e,
            loadingText: 'Please wait while I log you in'));
      }
    });
  }
}
