import 'package:MyNotes/services/auth/auth_exceptions.dart';
import 'package:MyNotes/services/auth/bloc/auth_event.dart';
import 'package:MyNotes/utilities/dialogs/error_dialog.dart';

import 'package:MyNotes/services/auth/bloc/auth_bloc.dart';
import 'package:MyNotes/services/auth/bloc/auth_state.dart';
import 'package:MyNotes/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

late final TextEditingController _email;
late final TextEditingController _password;

class _RegisterViewState extends State<RegisterView> {
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
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state.exception is WeakPasswordAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_weak_password,
            );
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_email_already_in_use,
            );
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_generic,
            );
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(
              context,
              context.loc.register_error_invalid_email,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.loc.register,
          ),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.loc.register_view_prompt,
                ),
                TextField(
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: context.loc.email_text_field_placeholder,
                  ),
                ),
                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: context.loc.password_text_field_placeholder,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;
                          context.read<AuthBloc>().add(
                                AuthEventRegister(email, password),
                              );
                        },
                        child: Text(
                          context.loc.register,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEventLogOut());
                          },
                          child: Text(
                            context.loc.register_view_already_registered,
                          )),
                    ],
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
