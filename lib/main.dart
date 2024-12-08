import 'package:authors_route_app/firebase_options.dart';
import 'package:authors_route_app/services/auth_services.dart';
import 'package:authors_route_app/widgets/AuthorsRouteAddRoute.dart';
import 'package:authors_route_app/widgets/AuthorsRouteHomePage.dart';
import 'package:authors_route_app/widgets/AuthorsRouteReg.dart';
import 'package:authors_route_app/widgets/MyProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const AuthorsRouteApp());
}

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class AuthorsRouteApp extends StatefulWidget {
  const AuthorsRouteApp({super.key});

  @override
  State<AuthorsRouteApp> createState() => _AuthorsRouteAppState();
}

class _AuthorsRouteAppState extends State<AuthorsRouteApp> {
  @override
  void initState() {
    super.initState();
    FirebaseService().listenUser((user) {
      if (user == null) {
        Navigator.of(kNavigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const AuthScreen()),
              (route) => false, // Удаляем все предыдущие маршруты
        );
      } else {
        Navigator.of(kNavigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => UserInfoScreen(user: user)),
              (route) => false, // Удаляем все предыдущие маршруты
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: kNavigatorKey,
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
            bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),
          ),
          appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const AuthorsRouteHomePage(),
        '/add-route': (context) => const AuthorsRouteAddRoute(),
      },
    );
  }
}
