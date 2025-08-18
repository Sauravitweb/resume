import 'package:MyNotes/extensions/buildcontext/loc.dart';
import 'package:MyNotes/services/auth/bloc/auth_bloc.dart';
import 'package:MyNotes/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailViews extends StatefulWidget {
  const VerifyEmailViews({super.key});

  @override
  State<VerifyEmailViews> createState() => _VerifyEmailViewsState();
}

class _VerifyEmailViewsState extends State<VerifyEmailViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.verify_email,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  context.loc.verify_email_view_prompt,
                ),
              ),
              TextButton(
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(const AuthEventSendEmailVerification());
                  },
                  child: Text(
                    context.loc.verify_email_send_email_verification,
                  )),
              TextButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(
                        const AuthEventLogOut(),
                      );
                },
                child: Text(context.loc.restart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
