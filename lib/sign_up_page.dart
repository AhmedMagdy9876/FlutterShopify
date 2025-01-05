import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

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
        title: Text('Sign Up Page'),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Full name field
                TextFormField(
                  validator: fullNameValidator,
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your full name',
                  ),
                ),
                // Email field
                TextFormField(
                  validator: emailAddressValidator,
                  controller: _emailAddressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),
                // Password field
                TextFormField(
                  obscureText: _hidePassword,
                  validator: passwordValidator,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
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
                      return 'Passwords do not match!';
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      hintText: 'Confirm your password',
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
                        const SnackBar(
                            content: Text(
                                'Input validation failed! Resolve errors and try again')),
                      );
                      return;
                    }
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('You have signed up successfully'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                HomePage(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                            transitionDuration:
                                                Duration(seconds: 1)));
                                  },
                                  child: Text('Close')),
                            ],
                          );
                        });
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            )),
      ),
    );
  }
}

String? fullNameValidator(String? fullName) {
  if (fullName == null || fullName.isEmpty) {
    return 'Full name cannot be empty!';
  }
  final regex = RegExp('^[A-Z]');
  if (!regex.hasMatch(fullName)) {
    return 'Full name need be capitalized!';
  }
  return null;
}

String? emailAddressValidator(String? emailAddress) {
  if (emailAddress == null || emailAddress.isEmpty) {
    return 'Email address may not be empty!';
  }
  var valid = emailAddress.contains('@');
  if (!valid) {
    return 'Please enter a valid email address!';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password may not be empty!';
  }

  if (password.length < 6) {
    return 'Password has to be at least 6 characters!';
  }

  return null;
}
