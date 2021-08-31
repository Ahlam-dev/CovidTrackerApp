import 'package:flutter/material.dart';
class TableHeaderWidget extends StatelessWidget {

  Widget _getColumn(BuildContext context,Color c, String content){
    return Column(
    children: [
      CircleAvatar(
          radius: 7, backgroundColor: c),
      SizedBox(
        height: 6,
      ),
      Text(
        content,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(
            color: c, fontSize: 12),
      )
    ],
  );}


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Location",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.black, fontSize: 12),
        ), //location
        SizedBox(
          width: 50,
        ),
        _getColumn(context,Colors.blue[300],"Active"),
        _getColumn(context,Colors.green[400],"Recovered"),
        _getColumn(context,Colors.red[400],"Deaths"),

      ],
    );
  }
}
