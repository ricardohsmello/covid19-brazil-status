import 'dart:convert';
import 'package:covid19_brazil_status/models/country_model.dart';
import 'package:covid19_brazil_status/models/state_model.dart';
import 'package:covid19_brazil_status/util/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'interceptors/interceptor.dart';

class WebClient {
  var httpClientWithInterceptor =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

  Future<StateModel> fetchAllByUf(String uf) async {
    String _uf = await _getStateByGeo(uf);

    try {
      Response response = await _getResponse(Constants.baseURL + '/uf/' + (_uf ?? 'SP'));
      return StateModel.fromJson(jsonDecode(response.body));
    } catch(error) {
      return StateModel.withError(error.toString());
    }

  }

  Future<CountryModel> fetchAll() async {
    try {
      Response response = await _getResponse(Constants.baseURL);

      return CountryModel.fromJson(jsonDecode(response.body));
    } catch(error) {
      return CountryModel.withError(error.toString());
    }
  }

  Future<Response> _getResponse(String url) async {
    Response response =
        await httpClientWithInterceptor.get(url).timeout(Duration(seconds: 35));
    return response;
  }

  Future<String> _getStateByGeo(String _uf) async {
    if (_uf == null) {
      Geolocator geo = Geolocator();

      Position currentPosition =
          await geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placeMarks = await geo.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      String currentState =
          placeMarks.first.administrativeArea.replaceAll('State of ', '');
      _uf = Constants.states[currentState];
    }

    return _uf;
  }
}
