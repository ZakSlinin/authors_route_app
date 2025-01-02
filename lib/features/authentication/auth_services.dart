import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  // singleton дает возможность вызывать класс из любого места в приложении
  static final FirebaseService _singleton = FirebaseService._internal();
  factory FirebaseService() => _singleton;
  FirebaseService._internal();

  final auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  bool get isAuthenticated => currentUser != null;

  void listenUser(void Function(User?)? doListen) {
    auth.authStateChanges().listen(doListen);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final identifier = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print(identifier);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password.');
        }
      }
    }
  }

  Future<void> reg({required String email, required String password}) async {
    try {
      final identifier = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print(identifier);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('email already in use');
        }
      } else if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('password is too weak, try another');
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<void> verificationEmail() async {
    if (currentUser != null) {
      await currentUser!.sendEmailVerification();
    } else {
      if (kDebugMode) {
        print('No user is currently signed in.');
      }
    }
  }
}
