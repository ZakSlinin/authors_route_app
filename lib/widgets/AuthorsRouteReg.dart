import 'package:flutter/material.dart';

class AuthorsRouteReg extends StatelessWidget {
  const AuthorsRouteReg ({super.key});
  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context);
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final repeatPasswordController = TextEditingController();
    return Scaffold(
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
                          filled: true
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
                          filled: true
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: repeatPasswordController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Пароль',
                          labelStyle: theme.textTheme.bodyMedium,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          fillColor: const Color.fromARGB(255, 217, 217, 217),
                          filled: true
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: 390,
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                              onPressed: () {
                                if (nameController.text.isEmpty || passwordController.text.isEmpty || repeatPasswordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Пожалуйста, заполните все поля')));
                                } else if (passwordController.text != repeatPasswordController.text){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Пароли не совпадают')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Вход успешно выполнен')));
                                  Navigator.of(context).pushNamed('/home');
                                }
                              },
                              child: Center(child: Text('Зарегестрироваться', style: theme.textTheme.bodyLarge))
                          )
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 390,
                        child: const Center(child: Text('У меня есть аккаунт!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal))),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
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