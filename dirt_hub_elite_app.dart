import 'package:flutter/material.dart';
import 'pages/buyers_page.dart';  // Updated import path for BuyersPage
import 'pages/sellers_page.dart'; // Updated import path for SellersPage
import 'pages/transport_page.dart'; // Updated import path for TransportPage

class DirtHubEliteApp extends StatefulWidget {
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
        title: Text('DirtHub Elite'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
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