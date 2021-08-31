import 'package:covid_tracker/Service/Api_Manager.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'Models/apiresponse.dart';
import 'dailyInfo.dart';

class countrySelector extends StatefulWidget {
  @override
  _countrySelectorState createState() => _countrySelectorState();
}

class _countrySelectorState extends State<countrySelector> {
  Future<Countries> countryList;
  var _selectedCountry = "Saudi-Arabia";
  @override
  void initState() {
    countryList = API_Manager().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height/15,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(width: 1, color: Colors.blueGrey[100])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.location_on,
              size: 25,
              color: Color(0xff1c2d71),
            ),
            Expanded(
              child: FutureBuilder<Countries>(
                  future: countryList,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _selectedCountry,
                        onChanged: (String e) {
                          setState(() {
                            _selectedCountry = e;
                          });
                        },
                        items: snapshot.data.response
                            .map<DropdownMenuItem<String>>((String e) {
                          return DropdownMenuItem<String>(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                      );
                    } else {
                      return Text("null");
                    }
                  }),
            )
          ],
        ),
      ),
        DailyInfo(_selectedCountry)
    ]);
  }
}
