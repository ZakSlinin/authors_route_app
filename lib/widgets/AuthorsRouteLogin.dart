import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorsRouteLogin extends StatelessWidget {
  const AuthorsRouteLogin ({super.key});

  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, title: Text('Авторизация', style: theme.textTheme.bodyLarge,),
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
                    Text(
                      'Войти или зарегестрироваться',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: nameController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Имя',
                          labelStyle: theme.textTheme.bodyMedium,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          fillColor: const Color.fromARGB(255, 217, 217, 217),
                          filled: true,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: passwordController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Пароль',
                          labelStyle: theme.textTheme.bodyMedium,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          fillColor: const Color.fromARGB(255, 217, 217, 217),
                          filled: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                              onPressed: () {
                                if (nameController.text.isEmpty || passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('пожалуйста, заполните все поля')));
                                } else {
                                  Navigator.of(context).pushNamed('/home');
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('вход успешно выполнен')));
                                }
                              },
                              child: Center(child: Text('Войти', style: theme.textTheme.bodyLarge))
                          )
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