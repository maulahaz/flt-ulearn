import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

Widget text24Normal(
    {String text = "",
    Color color = cTx1,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24, fontWeight: fontWeight),
  );
}



class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text16Normal(
      {Key? key,
      this.text = "",
      this.color = cTx2,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16, fontWeight: fontWeight),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text14Normal(
      {Key? key,
      this.text = "",
      this.color = cTx1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color, fontSize: 14, fontWeight: FontWeight.normal),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text11Normal(
      {Key? key,
        this.text = "",
        this.color = cTx1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color, fontSize: 11, fontWeight: FontWeight.normal),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text10Normal(
      {Key? key,
        this.text = "",
        this.color = cTx1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color, fontSize: 10, fontWeight: FontWeight.normal),
    );
  }
}

Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: cTx1,
        decoration: TextDecoration.underline,
        decorationColor: cTx1,
      ),
    ),
  );
}
