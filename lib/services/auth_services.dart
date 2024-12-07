import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  // singleton дает возможность вызывать класс из любого места в приложении
  static final FirebaseService _singleton = FirebaseService._internal();
  factory FirebaseService() => _singleton;
  FirebaseService._internal();

  final auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  void listenUser(void Function(User?)? doListen) {
    auth.authStateChanges().listen(doListen);
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      final identifier = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(identifier);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password.');
      }
    }
  }

  void reg({required String email, required String password}) async {
    try {
      final identifier = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(identifier);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('email already in use');
      } else if (e.code == 'weak-password') {
        print('password is too weak, try another');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<void> verificationEmail() async {
    if (currentUser != null) {
      await currentUser!.sendEmailVerification();
    } else {
      print('No user is currently signed in.');
    }
  }

  @override
  String toString() {
    if (currentUser == null) {
      return 'no user';
    } else {
      return 'user ${currentUser!.email}';
    }
  }
}
