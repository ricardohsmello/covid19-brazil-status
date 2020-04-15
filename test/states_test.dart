import 'package:covid19_brazil_status/util/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Should return the total number of states in brazil(including the DF) when get states length',
      () {
    expect(Constants.states.length, 27);
  });
}
