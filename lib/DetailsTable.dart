import 'package:covid_tracker/Service/Api_Manager.dart';
import "package:flutter/material.dart";

import 'Models/CountryStatistics.dart';
import 'TableHeaderWidget.dart';

class DetailsTable extends StatefulWidget {
  @override
  _DetailsTableState createState() => _DetailsTableState();
}

class _DetailsTableState extends State<DetailsTable> {
  Future<List<CountryStatistics>> list;
  List<CountryStatistics> data;
  @override
  void initState() {
    list = API_Manager().getCountriesStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<CountryStatistics>>(
          future: list,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              data = snapshot.data;

              return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                  TableHeaderWidget() ,
                    Container(
                      margin: const EdgeInsetsDirectional.only(top: 10),
                      height: MediaQuery.of(context).size.height /2.6,
                      child: SingleChildScrollView(
                        child: DataTable(
                            dividerThickness: 0,
                            headingRowHeight: 0,
                            columnSpacing: 8,
                            columns: [
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("")),
                              DataColumn(label: Text("")),
                            ],
                            rows: [
                              ...data.map((country) {
                                return DataRow(cells: [
                                  DataCell(Text(country.country)),
                                  DataCell(Text(country.cases.active == null
                                      ? "0"
                                      : country.cases.active.toString())),
                                  DataCell(Text(country.cases.recovered == null
                                      ? "0"
                                      : country.cases.recovered.toString())),
                                  DataCell(Text(country.deaths.deathsNew == null
                                      ? "0"
                                      : country.deaths.deathsNew
                                          .toString()
                                          .substring(1)))
                                ]);
                              }).toList()
                            ]),
                      ),
                    )
                  ]));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
