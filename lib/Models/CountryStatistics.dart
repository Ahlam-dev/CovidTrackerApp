// To parse this JSON data, do
//
//     final countryStatistics = countryStatisticsFromJson(jsonString);

import 'dart:convert';

List<CountryStatistics> countryStatisticsFromJson(String str) => List<CountryStatistics>.from(json.decode(str).map((x) => CountryStatistics.fromJson(x)));

String countryStatisticsToJson(List<CountryStatistics> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryStatistics {
  CountryStatistics({
    this.cases,
    this.continent,
    this.country,
    this.day,
    this.deaths,
    this.population,
    this.tests,
    this.time,
  });

  Cases cases;
  String continent;
  String country;
  DateTime day;
  Deaths deaths;
  int population;
  Tests tests;
  DateTime time;

  factory CountryStatistics.fromJson(Map<String, dynamic> json) => CountryStatistics(
    cases: Cases.fromJson(json["cases"]),
    continent: json["continent"],
    country: json["country"],
    day: DateTime.parse(json["day"]),
    deaths: Deaths.fromJson(json["deaths"]),
    population: json["population"],
    tests: Tests.fromJson(json["tests"]),
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "cases": cases.toJson(),
    "continent": continent,
    "country": country,
    "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
    "deaths": deaths.toJson(),
    "population": population,
    "tests": tests.toJson(),
    "time": time.toIso8601String(),
  };
}

class Cases {
  Cases({
    this.casesNew,
    this.active,
    this.critical,
    this.recovered,
    this.total,
  });

  String casesNew;
  int active;
  int critical;
  int recovered;
  int total;

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
    casesNew: json["new"],
    active: json["active"],
    critical: json["critical"],
    recovered: json["recovered"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "new": casesNew,
    "active": active,
    "critical": critical,
    "recovered": recovered,
    "total": total,
  };
}

class Deaths {
  Deaths({
    this.the1MPop,
    this.deathsNew,
    this.total,
  });

  String the1MPop;
  String deathsNew;
  int total;

  factory Deaths.fromJson(Map<String, dynamic> json) => Deaths(
    the1MPop: json["1M_pop"],
    deathsNew: json["new"] == null ? null : json["new"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "1M_pop": the1MPop,
    "new": deathsNew == null ? null : deathsNew,
    "total": total,
  };
}

class Tests {
  Tests({
    this.the1MPop,
    this.total,
  });

  String the1MPop;
  int total;

  factory Tests.fromJson(Map<String, dynamic> json) => Tests(
    the1MPop: json["1M_pop"] == null ? null : json["1M_pop"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "1M_pop": the1MPop == null ? null : the1MPop,
    "total": total,
  };
}
