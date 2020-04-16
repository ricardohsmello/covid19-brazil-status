import 'package:covid19_brazil_status/main.dart';
import 'package:covid19_brazil_status/ui/widgets/country_widget.dart';
import 'package:covid19_brazil_status/ui/widgets/state_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Should display the cards of dashboard screen. Card total country and filter by states', (
      tester) async {
    await tester.pumpWidget(MyApp());

    final countryWidget = find.byType(CountryWidget);
    expect(countryWidget, findsOneWidget);

    final selectStateWidget = find.byType(SelectStateWidget);
    expect(selectStateWidget, findsOneWidget);

  });



 }