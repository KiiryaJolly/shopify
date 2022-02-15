

import 'package:flutter/material.dart';

import 'Color.dart';

String toUpper(String txt) => txt.toUpperCase();

TextStyle shopListSwitchText(bool active){
  return TextStyle(
    color: active ? primaryColor : greyColor,
    fontSize: normalText-2
  );
}


TextStyle shopListButton(){
  return TextStyle(
      color: primaryColor,
      fontSize: normalText-2
  );
}

TextStyle shopListTitleText(){
  return TextStyle(
      color: Colors.black,
      fontSize: normalText-2,
      fontWeight: FontWeight.bold
  );
}


TextStyle shopListSubTitleText(){
  return TextStyle(
      color: greyColor,
      fontSize: normalText-4
  );
}


TextStyle detailsTabTitle(){
  return TextStyle(
    fontSize: normalText-4,
    fontWeight: FontWeight.w500
  );
}
