import 'package:flutter/material.dart';

import 'x_widgets.dart';

Widget TextFieldRoundIcon(
    {TextEditingController? controller,String text = "",String iconName = "",String hintText = "Type in your info",bool obscureText = false,
      void Function(String value)? func}) {

  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text14Normal(text: text),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 325,
          height: 50,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Image.asset(iconName),
              ),
              TextFieldRound(
                  controller: controller,
                  hintText: hintText,
                  func: func,
                  obscureText: obscureText),
            ],
          ),
        )
      ],
    ),
  );
}

Widget TextFieldRound({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 280,
  double height = 50,
  void Function(String value)? func,
  bool obscureText = false,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextField(

      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7, left: 10),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //default border without any input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //focused border is with input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),

      maxLines: 1,
      autocorrect: false,
      //by defualt it's false
      obscureText: obscureText,
    ),
  );
}
