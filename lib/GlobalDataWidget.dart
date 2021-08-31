import 'package:covid_tracker/Service/Api_Manager.dart';
import 'package:flutter/material.dart';
class GlobalDataWidget extends StatefulWidget {
  @override
  _GlobalDataWidgetState createState() => _GlobalDataWidgetState();
}
class _GlobalDataWidgetState extends State<GlobalDataWidget> {






  Widget getCountainer(String title, String content, Color c, double width) {
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: c,
        ),
        //padding: EdgeInsets.only(left: 20),
        width: width,
        height: MediaQuery.of(context).size.height / 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              content == null ? "0 " : content,
              style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 14),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ));
  }
  Future<Map<String,dynamic >> globalResults;
  @override
  void initState() {
    globalResults=API_Manager().getCountryStatistics("all");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Map<String,dynamic >>(future: globalResults,
        builder:(context,snapshot){
      if(snapshot.hasData){
        var data=snapshot.data;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCountainer("Active", data["cases"]["active"].toString(), Colors.blue[300],
              MediaQuery.of(context).size.width / 4),
          getCountainer("Recovered", data["cases"]["recovered"].toString(), Colors.green[400],
              MediaQuery.of(context).size.width / 4),
          getCountainer("Deaths", data["deaths"]["new"].toString().substring(1), Colors.red[400],
              MediaQuery.of(context).size.width / 4),
        ],
    );}else return CircularProgressIndicator(backgroundColor: Colors.blue[300],);
        }
    );
  }
}
