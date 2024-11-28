import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, title: Text('Имя автора', style: theme.textTheme.bodyLarge,),
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
                  children: [
                    Text('Маршруты автора: ', style: theme.textTheme.bodyLarge,),
                    SizedBox(height: 25,),
                    // TODO: API
                    Container(
                      height: 100,
                      child: DecoratedBox(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(215, 217, 217, 217)),
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) => const ListTile(
                            title: Text('Название подборки'),
                            subtitle: Text('описание'),
                          ),
                        ),
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