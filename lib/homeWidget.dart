
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'countrySelector.dart';
class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: myClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height/3,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff1c2d71), Color(0xff4974a5)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight)),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40),
                child: SvgPicture.asset(
                  "assets/images/Drcorona.svg",
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width/3,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                child: Text(
                  "Covid-19 Tracker",
                  style: TextStyle(color: Colors.white, fontSize: MediaQuery.textScaleFactorOf(context)*24),
                ),
                right: 40,
                top: 80,
              )
            ]),
          ),
        ),
        countrySelector()],
    );
  }
}

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }}