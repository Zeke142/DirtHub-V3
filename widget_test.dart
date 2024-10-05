import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dirthub_elite/app/dirt_hub_elite_app.dart';  // Correct import for the main app

void main() {
  // Basic test to check if the app builds and runs correctly
  testWidgets('DirtHubEliteApp builds and displays correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const DirtHubEliteApp());  // Use pumpWidget to load the app

    // Verify if a widget is present in the UI by searching for it
    expect(find.text('DirtHub Elite'), findsOneWidget);  // Check if the app bar displays "DirtHub Elite"
  });

  // Test navigation between pages (Buyers, Sellers, Transport)
  testWidgets('Test navigation to BuyersPage, SellersPage, and TransportPage', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const DirtHubEliteApp());

    // Check if BuyersPage is displayed by default
    expect(find.text('Buyers Page'), findsOneWidget);

    // Tap the Sellers tab in the bottom navigation bar
    await tester.tap(find.byIcon(Icons.store));
    await tester.pumpAndSettle();  // Wait for the navigation animation to finish

    // Verify SellersPage is now visible
    expect(find.text('Sellers Page'), findsOneWidget);

    // Tap the Transport tab in the bottom navigation bar
    await tester.tap(find.byIcon(Icons.local_shipping));
    await tester.pumpAndSettle();  // Wait for the navigation animation to finish

    // Verify TransportPage is now visible
    expect(find.text('Transport Page'), findsOneWidget);
  });
}