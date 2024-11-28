import 'package:authors_route_app/widgets/AuthorsRouteAddRoute.dart';
import 'package:authors_route_app/widgets/AuthorsRouteHomePage.dart';
import 'package:authors_route_app/widgets/AuthorsRouteLogin.dart';
import 'package:authors_route_app/widgets/AuthorsRouteReg.dart';
import 'package:authors_route_app/widgets/MyProfile.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AuthorsRouteApp());

class AuthorsRouteApp extends StatelessWidget {
  const AuthorsRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AuthorsRouteApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 118, 118, 118),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))
      ),
      routes: {
        '/': (context) => const AuthorsRouteReg(),
        '/login': (context) => const AuthorsRouteLogin(),
        '/home': (context) => const AuthorsRouteHomePage(),
        '/add-route': (context) => const AuthorsRouteAddRoute(),
        '/my-profile': (context) => const MyProfile(),
      },
    );
  }
}
