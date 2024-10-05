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