import 'package:authors_route_app/app/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorsAddRoutePage extends StatelessWidget {
  const AuthorsAddRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController countryController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Добавьте маршрут', style: theme.textTheme.bodyLarge),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/jpg/bg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Название маршрута',
                        labelStyle: theme.textTheme.bodyMedium,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: countryController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Страна',
                        labelStyle: theme.textTheme.bodyMedium,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: cityController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Город',
                        labelStyle: theme.textTheme.bodyMedium,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        fillColor: const Color.fromARGB(255, 217, 217, 217),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: TextField(
                          controller: descriptionController,
                          style: const TextStyle(color: Colors.black),
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Описание',
                            labelStyle: theme.textTheme.bodyMedium,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            fillColor: const Color.fromARGB(255, 217, 217, 217),
                            filled: true,
                          ),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                              onPressed: () {
                                if (cityController.text.isEmpty ||
                                    countryController.text.isEmpty ||
                                    descriptionController.text.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('пожалуйста, заполните все поля')));
                                } else {
                                  context.router.push(const AuthorsRouteHomeRoute());
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('опубликовано')));
                                }
                              },
                              child: Center(child: Text('Опубликовать', style: theme.textTheme.bodyLarge)))),
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
