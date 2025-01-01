import 'package:authors_route_app/features/authentication/auth_services.dart';
import 'package:authors_route_app/pages/authentication/ui/auth_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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
    final theme = Theme.of(context);
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
        title: Text(
          'Firebase $buttonText',
          style: theme.textTheme.bodyLarge,
        ),
        backgroundColor: Colors.black,
      ),
      body: DecoratedBox(
        decoration:
            const BoxDecoration(image: DecorationImage(image: AssetImage('assets/jpg/bg.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(1, 180, 1, 2),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
