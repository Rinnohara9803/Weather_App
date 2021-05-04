import 'package:flutter/material.dart';

const kTextStyleOne = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25.0,
  color: Colors.white70,
  fontWeight: FontWeight.bold,
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kMessageTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter name of the city',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
);
