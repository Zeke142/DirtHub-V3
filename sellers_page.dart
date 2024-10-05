import 'package:flutter/material.dart';

class SellersPage extends StatelessWidget {
  const SellersPage({Key? key}) : super(key: key);  // Added named 'key' parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sellers Page'),
      ),
      body: const Center(
        child: Text('This is the Sellers Page'),
      ),
    );
  }
}