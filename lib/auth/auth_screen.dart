import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen>{
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("UStudy test"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter a valid email adress.';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   _enteredEmail = value!;
                        // },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().length < 6) {
                            return 'Password should be at least 6 characters long';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        // onSaved: (value) {
                        //   _enteredPassword = value!;
                        // },
                      ),
                      const SizedBox(height: 20),
                      // if (_isAuthenticating)
                      //   const CircularProgressIndicator.adaptive(),
                      // if (!_isAuthenticating)
                      //   ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Theme.of(context)
                      //           .colorScheme
                      //           .primaryContainer,
                      //     ),
                      //     onPressed: _submit,
                      //     child: Text(_isLogin ? 'Login' : "Sign Up"),
                      //   ),
                      // if (!_isAuthenticating)
                      //   TextButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         _isLogin = !_isLogin;
                      //       });
                      //     },
                      //     child: Text(
                      //       _isLogin
                      //           ? "Create an account"
                      //           : 'I have an account',
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}