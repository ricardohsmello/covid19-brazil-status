import 'package:covid19_brazil_status/models/state_model.dart';
import 'package:covid19_brazil_status/repository/covid19_brazil_repository.dart';
import 'package:covid19_brazil_status/models/country_model.dart';
import 'package:rxdart/rxdart.dart';

class Covid19BrasilBloc {
  final Covid19BrazilRepository _repository = Covid19BrazilRepository();
  final BehaviorSubject<CountryModel> _countryData =
      BehaviorSubject<CountryModel>();
  final BehaviorSubject<StateModel> _stateData = BehaviorSubject<StateModel>();

  getCountry() async {
    CountryModel response = await _repository.fetchAll();
    _countryData.sink.add(response);
  }

  getState(String uf) async {
    StateModel response = await _repository.fetchAllByUf(uf);
    _stateData.sink.add(response);
  }

  dispose() {
    _countryData.close();
    _stateData.close();
  }

  BehaviorSubject<CountryModel> get countryData => _countryData;

  BehaviorSubject<StateModel> get stateData => _stateData;
}

final covid19BrasilBloc = Covid19BrasilBloc();
