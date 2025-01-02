import 'package:authors_route_app/app/app_router.gr.dart';
import 'package:authors_route_app/features/authentication/auth_services.dart';
import 'package:authors_route_app/pages/profile/user_profile_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorsRouteHomePage extends StatelessWidget {
  const AuthorsRouteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/jpg/bg.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(1, 20, 1, 2),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          final user = FirebaseService().currentUser;

                          if (user != null) {
                            context.router.push(UserProfileRoute(user: user));
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.face_retouching_natural,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text(
                              'Мой профиль',
                              style: theme.textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      //TODO: REST API
                      SizedBox(
                        height: 450,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(215, 217, 217, 217)),
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => ListTile(
                              title: const Text('Название подборки'),
                              subtitle: const Text('описание'),
                              onTap: () {
                                //TODO: API
                              },
                            ),
                          ),
                        ),
                      ), // Routes list
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            context.router.push(const AuthorsAddRouteRoute());
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Image.asset('assets/jpg/plus.jpg'),
                                const SizedBox(height: 10),
                                const Text(
                                  'Создать маршрут',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
