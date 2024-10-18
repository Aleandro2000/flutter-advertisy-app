import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:advertisy/main.dart';

void main() {
  testWidgets('MainApp is rendered', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
