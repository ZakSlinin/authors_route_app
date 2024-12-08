import 'package:flutter/material.dart';
import '../services/auth_form.dart';
import '../services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = false;
  final FirebaseService firebaseService = FirebaseService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context);
    final onAuth = isLogin
        ? () => firebaseService.login(
      email: emailController.text,
      password: passwordController.text,
    )
        : () => firebaseService.reg(
      email: emailController.text,
      password: passwordController.text,
    );
    final buttonText = isLogin ? 'Login' : 'Register';

    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase ${buttonText}', style: theme.textTheme.bodyLarge,), backgroundColor: Colors.black,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/jpg/bg.jpg'), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(1, 180, 1, 2),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16 ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          AuthForm(
                            authButtonText: buttonText,
                            onAuth: onAuth,
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                          TextButton(
                            child: Text(buttonText),
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}