class StateModel {
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  String datetime;

  StateModel({this.uf, this.state, this.cases, this.deaths, this.suspects,
    this.refuses, this.datetime});

  factory StateModel.fromJson(Map<String, dynamic> parsedJson) {
    return StateModel(
      uf: parsedJson['uf'],
      state: parsedJson['state'],
      cases: parsedJson['cases'],
      deaths: parsedJson['deaths'],
      suspects: parsedJson['suspects'],
      refuses: parsedJson['refuses'],
      datetime: parsedJson['datetime'],
    );
  }

  List<StateModel> results;
  String error;

  StateModel.withError(String errorValue)
      : results = List(),
        error = errorValue;
}