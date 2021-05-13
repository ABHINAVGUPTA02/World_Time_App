// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //ask for location
  String flag; //based on the location a flag appears
  String ur; //the api for exact time
  String time; //the time in that location
  bool isDaytime; //for day and night time confusion

  //creating a constructor
  WorldTime({this.location, this.flag, this.ur});

  Future<void> getTime() async {
    try {
      var url = Uri.parse("http://worldtimeapi.org/api/timezone/$ur");
      // var url = Uri.parse("http://worldtimeapi.org/api/timezone/Europe/London");
      // $ flutter pub add http.'http://worldtimeapi.org/api/timezone/Europe/London';
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      // extracting values from the api
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String min = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now =
          now.add(Duration(hours: int.parse(offset), minutes: int.parse(min)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('$e');
      time = 'could not get the time from the given data';
    }
  }
}
