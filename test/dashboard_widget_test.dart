import 'package:covid19_brazil_status/components/combo_box_states.dart';
import 'package:covid19_brazil_status/components/progress.dart';
import 'package:covid19_brazil_status/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should display the AppBar when Dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(Dashboard());
     final first = find.byType(AppBar);
    expect(first, findsOneWidget);
  });

  testWidgets('should display the select states when Dashboard is opened',
          (WidgetTester tester) async {
        await tester.pumpWidget(Dashboard());
        final first = find.byType(type)

        expect(first, findsOneWidget);
      });
}
