import 'package:MyNotes/extensions/buildcontext/loc.dart';
import 'package:MyNotes/services/auth/auth_exceptions.dart';
import 'package:MyNotes/services/auth/bloc/auth_bloc.dart';
import 'package:MyNotes/services/auth/bloc/auth_event.dart';
import 'package:MyNotes/services/auth/bloc/auth_state.dart';
import 'package:MyNotes/utilities/dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

late final TextEditingController _email;
late final TextEditingController _password;

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(
                context, context.loc.login_error_cannot_find_user);
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(
                context, context.loc.login_error_wrong_credentials);
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, context.loc.login_error_auth_error);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.login),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(context.loc.login_view_prompt),
                TextField(
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: InputDecoration(
                      hintText: context.loc.email_text_field_placeholder),
                ),
                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _password,
                  decoration: InputDecoration(
                      hintText: context.loc.password_text_field_placeholder),
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    context.read<AuthBloc>().add(
                          AuthEventLogIn(
                            email,
                            password,
                          ),
                        );
                  },
                  child: Text(
                    context.loc.login,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final email = _email.text;
                    context.read<AuthBloc>().add(
                          AuthEventFotgotPassword(email),
                        );
                  },
                  child: Text(
                    context.loc.login_view_forgot_password,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEventShouldRegister(),
                        );
                  },
                  child: Text(
                    context.loc.login_view_not_registered_yet,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
