import 'package:flutter/material.dart';
import 'package:ttm/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content:
        'We have sent you a password reset link. Please check your email for more information.',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
