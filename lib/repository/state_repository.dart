import 'package:covid19_brazil_status/http/webclient.dart';
import 'package:covid19_brazil_status/models/state_model.dart';

class StateRepository {
  WebClient _webClient = WebClient();

  Future<StateModel> getState(String uf) {
    return _webClient.fetchAllByUf(uf);
  }
}
