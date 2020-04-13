import 'dart:async';

import 'package:covid19_brazil_status/http/webclient.dart';
import 'package:covid19_brazil_status/models/statistics_by_states.dart';

class DashboardCardsBloc {

  final StreamController<String> _streamController = StreamController<String>.broadcast();
  Sink<String> get input => _streamController.sink;
  Stream<StatisticsStates> get output => _streamController.stream.asyncMap((uf) {
    return _fetchAllByUf(uf);
  });


  WebClient _webClient = WebClient();

  Future<StatisticsStates>_fetchAllByUf(String uf) async {
    return await _webClient.fetchAllStatistics(uf);
  }
}