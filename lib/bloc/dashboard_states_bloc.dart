import 'dart:async';

class DashboardStatesBloc {

  final StreamController<String> _streamController = StreamController<String>.broadcast();
  Sink<String> get input => _streamController.sink;
  Stream<String> get output => _streamController.stream.asyncMap((uf) {
    return uf;
  });

}