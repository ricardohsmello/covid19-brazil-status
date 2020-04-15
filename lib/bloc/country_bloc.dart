import 'package:covid19_brazil_status/models/country_model.dart';
import 'package:covid19_brazil_status/repository/country_repository.dart';
import 'package:rxdart/rxdart.dart';

class CountryBloc {

  final CountryRepository _repository = CountryRepository();
  final BehaviorSubject<CountryModel> _subject = BehaviorSubject<CountryModel>();

  getCountry() async {
    CountryModel response = await _repository.getCountry();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CountryModel> get subject => _subject;

}

final countryBloc = CountryBloc();