import 'dart:ffi';

import 'package:clima_app/ScreenSecond.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherdata1);

  final weatherdata1;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temp;
  int temperature;
  int condition;
  String cityName;
  String theWeather;
  String theWeatherText;
  int humidity;
  int pressure;

  @override
  void initState() {
    super.initState();

    updateUI(widget.weatherdata1);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        theWeather = 'Error';
        theWeatherText = 'Unable to get WeatherData';
        cityName = '';
        return;
      }
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
      temp = weatherData['main']['temp'];
      temperature = temp.toInt() - 273;
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      print(temperature);

      WeatherModel weatherModel = WeatherModel();
      theWeather = weatherModel.getWeatherIcon(condition);
      theWeatherText = weatherModel.getMessage(temperature, cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.jfif'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData =
                          await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      print(typedName);
                      if (typedName != null) {
                        WeatherModel weatherModel1 = WeatherModel();
                        var weatherData =
                            await weatherModel1.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Container(
                height: 70.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Temperature : $temperature℃',
                        style: kTempTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      theWeather,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Humidity: $humidity',
                  style: kTextStyleOne,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Pressure: $pressure',
                  style: kTextStyleOne,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  theWeatherText + 'in ' + cityName,
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
