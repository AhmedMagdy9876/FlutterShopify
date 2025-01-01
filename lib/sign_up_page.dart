import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
            TextFormField(
              validator:fullNameValidator,
              controller: _fullNameController,
              decoration: const InputDecoration(
                hintText: 'Enter your full name',
              ),
            ),
            TextFormField(
              validator: emailAddressValidator,
              controller: _emailAddressController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            TextFormField(
              obscureText: _hidePassword,
              validator: passwordValidator,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                }, icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility))
              ),
            ),
            TextFormField(
              obscureText: _hideConfirmPassword,
              validator: (value){
                if (_passwordController.text != value) {
                  return 'Passwords do not match!';
                }
                return null;
              },
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                hintText: 'Confirm your password',
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _hideConfirmPassword = !_hideConfirmPassword;
                  });
                }, icon: Icon(_hideConfirmPassword ? Icons.visibility_off : Icons.visibility))
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var validationResult = _formKey.currentState!.validate();
                if (!validationResult){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Input validation failed! Resolve errors and try again')),
                  );
                  return;
                }
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    content: Text('You have signed up successfully'),
                    actions: [
                      TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())), child: Text('Close')),
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
    return
    'Password has to be at least 6 characters!';
  }

  return null;
}