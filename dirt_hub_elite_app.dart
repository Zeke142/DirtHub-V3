import 'package:flutter/material.dart';
import '../pages/buyers_page.dart';    // Ensure correct path to BuyersPage
import '../pages/sellers_page.dart';   // Ensure correct path to SellersPage
import '../pages/transport_page.dart'; // Ensure correct path to TransportPage

class DirtHubEliteApp extends StatefulWidget {
  const DirtHubEliteApp({super.key});

  @override
  _DirtHubEliteAppState createState() => _DirtHubEliteAppState();
}

class _DirtHubEliteAppState extends State<DirtHubEliteApp> {
  int _selectedIndex = 0;

  // List of the pages in the bottom navigation
  final List<Widget> _pages = [
    BuyersPage(),    // Ensure BuyersPage is defined and imported correctly
    SellersPage(),   // Ensure SellersPage is defined and imported correctly
    TransportPage(), // Ensure TransportPage is defined and imported correctly
  ];

  // Function to handle item selection in the bottom navigation bar
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
      body: _pages[_selectedIndex],  // Displays the currently selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // Keeps track of the selected index
        onTap: _onItemTapped,  // Updates the page when a navigation item is tapped
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