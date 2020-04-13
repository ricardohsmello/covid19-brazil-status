import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class DashboardStatesBloc extends BlocBase {

  final StreamController<String> _streamController = StreamController<String>.broadcast();
  Sink<String> get input => _streamController.sink;
  Stream<String> get output => _streamController.stream.asyncMap((uf) {
    return uf;
  });


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }
}