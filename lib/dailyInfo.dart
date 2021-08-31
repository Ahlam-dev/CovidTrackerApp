import 'package:covid_tracker/Models/CountryStatistics.dart';
import "package:flutter/material.dart";
import 'package:percent_indicator/percent_indicator.dart';

import 'Service/Api_Manager.dart';

class DailyInfo extends StatefulWidget {
  final String countryName;
  DailyInfo(this.countryName);
  @override
  _DailyInfoState createState() => _DailyInfoState();
}

class _DailyInfoState extends State<DailyInfo> {
  Future<Map<String, dynamic>> statistcs;
  @override
  void didUpdateWidget(DailyInfo oldWidget) {
    statistcs = API_Manager().getCountryStatistics(widget.countryName);
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    statistcs = API_Manager().getCountryStatistics(widget.countryName);

    super.initState();
  }

Widget getCountainer(String title,String content,Color c,double width){
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: c,
        ),
        padding: EdgeInsets.only(left: 20),
        width: width,
        height: MediaQuery.of(context).size.height/8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: Theme.of(context).textTheme.bodyText1,),
            Text(content==null||content=="null"?"0":content,style: Theme.of(context).textTheme.bodyText2,)
          ],
        )
    );
}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: statistcs,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            var CasesResult = snapshot.data['cases'];
            var deathResult = snapshot.data['deaths'];

            return Container( height: MediaQuery.of(context).size.height/3, margin: EdgeInsets.only(left: 15, right: 15, top: 60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      getCountainer("New Cases",CasesResult['new'],Colors.orangeAccent,MediaQuery.of(context).size.width/2.4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/20,
                      ), getCountainer("Deaths",deathResult['new']==null?"0":deathResult['new'],Colors.red[400],MediaQuery.of(context).size.width/2.4)

                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getCountainer("Recovered",CasesResult['recovered'].toString(),Colors.green[400],MediaQuery.of(context).size.width/3.5),
                      getCountainer("Active",CasesResult['active'].toString(),Colors.blue[300],MediaQuery.of(context).size.width/3.5),
                      getCountainer("Critical",CasesResult['critical'].toString(),Colors.purple[400],MediaQuery.of(context).size.width/3.5),

                    ],
                  )
                ],
              ),
            );
          } else {
            return   Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(backgroundColor: Colors.blue[300],),
            );
          }
        });
  }
}
