
import 'package:cookbook/components/authentication/auth-page.dart';
import 'package:cookbook/components/login.dart';
import 'package:cookbook/components/main-page.dart';
import 'package:cookbook/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
      // FirebaseOptions(apiKey: "AIzaSyA0PoVI6WRqF7UV80MUpFaYznpSJeBSpNM", appId: "1:602389487995:android:6e3d8389bd8aad73641dde", messagingSenderId: "602389487995", projectId: "recipe-824bc")
  );
  // runApp(const AuthPage());

  runApp(

    const MainPage()

  );
}


