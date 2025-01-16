import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    required this.onAuth,
    required this.authButtonText,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    Key? key,
  }) : super(key: key);

  final VoidCallback onAuth;
  final String authButtonText;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            fillColor: Color.fromARGB(255, 0, 0, 0),
            filled: true,
          ),
        ),
        const SizedBox(height: 16.0,),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            fillColor: Color.fromARGB(255, 0, 0, 0),
            filled: true,
          ),
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
            fillColor: Color.fromARGB(255, 0, 0, 0),
            filled: true,
          ),
          obscureText: true,
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: onAuth,
          child: Text(authButtonText),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton.icon(
          icon: Image.network('https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-32.png'),
          label: const Text('Sign in with Google'),
          onPressed: null,
        ),
      ],
    );
  }
}
