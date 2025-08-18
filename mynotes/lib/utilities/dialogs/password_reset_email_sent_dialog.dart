import 'package:MyNotes/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:MyNotes/extensions/buildcontext/loc.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: context.loc.password_reset,
    content: context.loc.password_reset_dialog_prompt,
    optionsBuilder: () => {
      context.loc.ok: null,
    },
  );
}
