import 'package:covid19_brazil_status/http/webclient.dart';
import 'package:covid19_brazil_status/models/country_model.dart';

class CountryRepository {

  WebClient _webClient = WebClient();

  Future<CountryModel> getCountry() {
    return _webClient.fetchAll();
  }

}