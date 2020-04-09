//{"data":{"country":"Brazil","cases":11547,"confirmed":12240,"deaths":566,"recovered":127,"updated_at":"2020-04-07T12:23:24.000Z"}}

class StatisticsCountry {
  String country;
  int cases;
  int confirmed;
  int deaths;
  int recovered;
  String updatedAt;

  StatisticsCountry(
      {this.country,
      this.cases,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.updatedAt});

  factory StatisticsCountry.fromJson(Map<String, dynamic> parsedJson) {
    return StatisticsCountry(
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


