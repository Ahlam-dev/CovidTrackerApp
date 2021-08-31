import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:covid_tracker/Models/CountryStatistics.dart';
import 'package:covid_tracker/Models/apiresponse.dart';
import 'package:covid_tracker/countrySelector.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Countries> getCountries() async {
    var client = http.Client();
    var countryList = null;
    try {
      var response = await client
          .get("https://covid-193.p.rapidapi.com/countries", headers: {
        "x-rapidapi-key": "b7c6f0b423msh66ea871b5685054p199f84jsnfdd3e32c726c",
        "x-rapidapi-host": "covid-193.p.rapidapi.com"
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        countryList = Countries.fromJson(jsonMap);
      }
    } catch (Exception) {
      return countryList;
    }
    return countryList;
  }


  Future<Map<String,dynamic >> getCountryStatistics(String countryName) async {
    var client = http.Client();
    var cstatistics = null;
    try {
      var response = await client.get(
          "https://covid-193.p.rapidapi.com/statistics?country="+countryName,
          headers: {
            "x-rapidapi-key": "b7c6f0b423msh66ea871b5685054p199f84jsnfdd3e32c726c",
            "x-rapidapi-host": "covid-193.p.rapidapi.com"
          });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
       cstatistics=jsonMap['response'][0];

      }

    } catch (Exception) {
      return cstatistics;
    }
    return cstatistics;
  }


Future<List<CountryStatistics>> getCountriesStatistics() async {
  var client = http.Client();
  List<CountryStatistics> CountryStatisticsList=new List<CountryStatistics>();

  try {
    var response = await client.get(
        "https://covid-193.p.rapidapi.com/statistics",
        headers: {
          "x-rapidapi-key": "b7c6f0b423msh66ea871b5685054p199f84jsnfdd3e32c726c",
          "x-rapidapi-host": "covid-193.p.rapidapi.com"
        });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      List<dynamic> cstatistics=new  List<dynamic>();
      cstatistics=jsonMap['response'];
if(cstatistics.length>0){
  for(int i=0;i<cstatistics.length;i++){
    if(cstatistics[i]!=null){
      Map<String,dynamic> map=cstatistics[i];
      CountryStatisticsList .add(CountryStatistics.fromJson(map));

    }

  }

}
    }

  } catch (Exception) {
    return CountryStatisticsList;
  }
  return CountryStatisticsList;
}

}
