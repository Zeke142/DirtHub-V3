import 'package:flutter/material.dart';
import 'auth/sign_in_page.dart'; // Correct import path for SignInPage
import 'pages/buyers_page.dart';  // Correct import path for BuyersPage
import 'pages/sellers_page.dart'; // Correct import path for SellersPage
import 'pages/transport_page.dart'; // Correct import path for TransportPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Added constructor key for consistency

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(), // Show SignInPage first
    );
  }
}

// Main app class with navigation
class DirtHubEliteApp extends StatefulWidget {
  const DirtHubEliteApp({super.key});

  @override
  _DirtHubEliteAppState createState() => _DirtHubEliteAppState();
}

class _DirtHubEliteAppState extends State<DirtHubEliteApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BuyersPage(),
    SellersPage(),
    TransportPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DirtHub Elite'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Buyers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Sellers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Transport',
          ),
        ],
      ),
    );
  }
}

// Sign-in Page (after successful sign-in, navigate to the main app)
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // Function to handle sign-in
  Future<void> _signIn() async {
    try {
      // Simulated sign-in logic
      // On successful sign-in, navigate to DirtHubEliteApp
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DirtHubEliteApp()), // Navigate to DirtHubEliteApp on sign-in
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to sign in. Please check your credentials.';
      });
      print("Error signing in: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}