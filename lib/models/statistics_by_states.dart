class StatisticsStates {
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  String datetime;

  StatisticsStates({this.uf, this.state, this.cases, this.deaths, this.suspects,
      this.refuses, this.datetime});
  
  factory StatisticsStates.fromJson(Map<String, dynamic> parsedJson) {
    return StatisticsStates(
      uf: parsedJson['uf'],
      state: parsedJson['state'],
      cases: parsedJson['cases'],
      deaths: parsedJson['deaths'],
      suspects: parsedJson['suspects'],
      refuses: parsedJson['refuses'],
      datetime: parsedJson['datetime'],
    );
  }
}

//{"uid":31,"uf":"MG","state":"Minas Gerais","cases":525,"deaths":9,"suspects":925,"refuses":104,"datetime":"2020-04-06T22:17:18.006Z"}