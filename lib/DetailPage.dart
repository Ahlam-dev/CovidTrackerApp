import 'package:flutter/material.dart';

import 'DetailsTable.dart';
import 'GlobalDataWidget.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          //margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Corona Virus (Covid-19)",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.blueGrey)),
              Text("updated less than 30 min ago",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.blueGrey,fontSize: 12)),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Icon(Icons.gps_fixed),
                Text("Worldwide",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.blueGrey))
              ]),
              GlobalDataWidget()
            ],
          ),
        ),
        DetailsTable()
      ],
    );
  }
}
