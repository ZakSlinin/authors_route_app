import 'package:authors_route_app/app/app_router.dart';
import 'package:authors_route_app/app/firebase_options.dart';
import 'package:authors_route_app/features/authentication/auth_services.dart';
import 'package:authors_route_app/pages/authentication/authendication_page.dart';
import 'package:authors_route_app/pages/profile/user_profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AuthorsRouteApp());
}

class AuthorsRouteApp extends StatefulWidget {
  const AuthorsRouteApp({super.key});

  @override
  State<AuthorsRouteApp> createState() => _AuthorsRouteAppState();
}

class _AuthorsRouteAppState extends State<AuthorsRouteApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AuthorsRouteApp',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
      routerConfig: appRouter.config(),
    );
  }
}
