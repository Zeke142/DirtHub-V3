import 'package:flutter/material.dart';

class BuyersPage extends StatelessWidget {
  const BuyersPage({Key? key}) : super(key: key);  // Added named 'key' parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buyers Page'),
      ),
      body: const Center(
        child: Text('This is the Buyers Page'),
      ),
    );
  }
}