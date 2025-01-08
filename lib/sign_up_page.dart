import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shopping_app/locale_dropdown.dart';

// the sign-up page widget
class SignUpPage extends StatefulWidget {
  final void Function(String? value)? localeChangeCallback;
  final void Function()? signUpSuccessfulCallback;
  const SignUpPage(
      {super.key, this.localeChangeCallback, this.signUpSuccessfulCallback});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _hidePassword = true;
  var _hideConfirmPassword = true;
  final _fullNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.signUpPageTitle),
        actions: [
          LocaleDropdown(
            // dropdown menu to set app locale
            callback: widget.localeChangeCallback,
          ),
          SizedBox(
            // dummy padding box
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Form(
            // the user input form
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Full name field
                TextFormField(
                  validator: (String? fullName) {
                    if (fullName == null || fullName.isEmpty) {
                      return AppLocalizations.of(context)!.fullNameEmptyMessage;
                    }
                    final regex = RegExp('^[A-Z]');
                    if (!regex.hasMatch(fullName)) {
                      return AppLocalizations.of(context)!
                          .fullNameCapitalizedMessage;
                    }
                    return null;
                  },
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.fullNameHint,
                  ),
                ),
                // Email field
                TextFormField(
                  validator: (String? emailAddress) {
                    if (emailAddress == null || emailAddress.isEmpty) {
                      return AppLocalizations.of(context)!
                          .emailAddressEmptyMessage;
                    }
                    var valid = emailAddress.contains('@');
                    if (!valid) {
                      return AppLocalizations.of(context)!
                          .emailAddressInvalidMessage;
                    }
                    return null;
                  },
                  controller: _emailAddressController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.emailHint,
                  ),
                ),
                // Password field
                TextFormField(
                  obscureText: _hidePassword,
                  validator: (String? password) {
                    if (password == null || password.isEmpty) {
                      return AppLocalizations.of(context)!.passwordEmptyMessage;
                    }

                    if (password.length < 6) {
                      return AppLocalizations.of(context)!
                          .passwordTooShortMessage;
                    }

                    return null;
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.passwordHint,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: Icon(_hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
                // Confirm password field
                TextFormField(
                  obscureText: _hideConfirmPassword,
                  validator: (value) {
                    if (_passwordController.text != value) {
                      return AppLocalizations.of(context)!
                          .confirmPasswordValidationMessage;
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.confirmPasswordHint,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hideConfirmPassword = !_hideConfirmPassword;
                            });
                          },
                          icon: Icon(_hideConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
                // Sign Up button
                ElevatedButton(
                  onPressed: () {
                    var validationResult = _formKey.currentState!.validate();
                    if (!validationResult) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(AppLocalizations.of(context)!
                                .signUpValidationFailureMessage)),
                      );
                      return;
                    }
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(AppLocalizations.of(context)!
                                .signUpSuccessMessage),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    widget.signUpSuccessfulCallback?.call();
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.close)),
                            ],
                          );
                        });
                  },
                  child: Text(AppLocalizations.of(context)!.signUp),
                ),
              ],
            )),
      ),
    );
  }
}
