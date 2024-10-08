import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../app/dirt_hub_elite_app.dart';  // Correct import for navigation to the main app

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});  // Using super parameter for the key

  @override
  SignUpPageState createState() => SignUpPageState();  // No underscore to avoid private type in public API
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  // Function to handle sign-up
  Future<void> _signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'Passwords do not match';
      });
      return;
    }

    try {
      // Try to sign up the user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Check if the widget is still mounted before navigating
      if (mounted) {
        // Navigate to the main app after sign-up
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DirtHubEliteApp()),  // Correct navigation to main app
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to create account. Please try again.';
      });
      debugPrint("Error creating account: $e");  // Use debugPrint for logging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign Up'),
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