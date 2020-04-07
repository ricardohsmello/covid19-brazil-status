class Statistics {
  String country;
  int cases;
  int confirmed;
  int deaths;
  int recovered;
  String updatedAt;

  Statistics(
      {this.country,
      this.cases,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.updatedAt});

  factory Statistics.fromJson(Map<String, dynamic> parsedJson) {
    return Statistics(
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
}
