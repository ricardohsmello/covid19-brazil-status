import 'package:covid19_brazil_status/models/state_model.dart';

import 'package:covid19_brazil_status/repository/state_repository.dart';
import 'package:rxdart/rxdart.dart';

class StateBloc {
  final StateRepository _repository = StateRepository();
  final BehaviorSubject<StateModel> _subject = BehaviorSubject<StateModel>();

  getState(String uf) async {
    StateModel response = await _repository.getState(uf);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<StateModel> get subject => _subject;
}

final stateBloc = StateBloc();
