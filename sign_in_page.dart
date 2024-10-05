import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../app/dirt_hub_elite_app.dart';  // Import for navigation to the main app

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});  // Using super parameter for the key

  @override
  SignInPageState createState() => SignInPageState();  // No underscore to avoid private type in public API
}

class SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // Function to handle sign-in
  Future<void> _signIn() async {
    try {
      // Sign in the user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Check if the widget is still mounted before navigating
      if (mounted) {
        // Navigate to the main app after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DirtHubEliteApp()),  // Correct navigation to main app
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to sign in. Please check your credentials.';
      });
      debugPrint("Error signing in: $e");  // Use debugPrint for logging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('Sign In'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}