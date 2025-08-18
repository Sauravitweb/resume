import 'package:MyNotes/helpers/loading/loading_screen.dart';
import 'package:MyNotes/services/auth/auth_service.dart';
import 'package:MyNotes/services/auth/bloc/auth_bloc.dart';
import 'package:MyNotes/services/auth/bloc/auth_event.dart';
import 'package:MyNotes/services/auth/bloc/auth_state.dart';
import 'package:MyNotes/services/firebase_auth_provider.dart';
import 'package:MyNotes/views/forgot_password_view.dart';
import 'package:MyNotes/views/login_view.dart';
import 'package:MyNotes/views/notes/create_update_note_view.dart';
import 'package:MyNotes/views/notes/notes_view.dart';
import 'package:MyNotes/views/register_view.dart';
import 'package:MyNotes/views/verify_email_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'dart:developer' as devtools show log;

import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.firebase().initialize();
  runApp(
    MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      title: 'MyNotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
              context: context,
              text: state.loadingText ?? "Please wait for a while");
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const NotesView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailViews();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateRegistering) {
          return const RegisterView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
