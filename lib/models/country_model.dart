class CountryModel {
  String country;
  int cases;
  int confirmed;
  int deaths;
  int recovered;
  String updatedAt;

  CountryModel(
      {this.country,
      this.cases,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.updatedAt});

  factory CountryModel.fromJson(Map<String, dynamic> parsedJson) {
    return CountryModel(
      country: parsedJson['data']['country'],
      cases: parsedJson['data']['cases'],
      confirmed: parsedJson['data']['confirmed'],
      deaths: parsedJson['data']['deaths'],
      recovered: parsedJson['data']['recovered'],
      updatedAt: parsedJson['data']['updated_at'],
    );
  }

  @override
  String toString() {
    return 'Statistics{country: $country, cases: $cases, confirmed: $confirmed, deaths: $deaths, recovered: $recovered, updatedAt: $updatedAt}';
  }

  List<CountryModel> results;
  String error;

  CountryModel.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
