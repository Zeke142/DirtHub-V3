import 'package:flutter/material.dart';
import 'auth/sign_in_page.dart';  // Correct import for SignInPage
import 'app/dirt_hub_elite_app.dart';  // Correct import for DirtHubEliteApp

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DirtHub Elite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',  // The initial route points to SignInPage
      routes: {
        '/': (context) => SignInPage(),  // Starting route is SignInPage
        '/home': (context) => DirtHubEliteApp(),  // After sign-in, navigate to the main app
      },
    );
  }
}