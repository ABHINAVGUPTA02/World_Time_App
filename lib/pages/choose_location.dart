import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(ur: 'Europe/London', flag: 'uk.png', location: 'London'),
    WorldTime(ur: 'Africa/Cairo', flag: 'egypt.png', location: 'Cairo'),
    WorldTime(ur: 'Africa/Nairobi', flag: 'kenya.png', location: 'Nairobi'),
    WorldTime(ur: 'Europe/Athens', flag: 'greece.png', location: 'Athens'),
    WorldTime(ur: 'America/Chicago', flag: 'usa.png', location: 'Chicago'),
    WorldTime(ur: 'Asia/Seoul', flag: 'south_korea.png', location: 'Seoul'),
    WorldTime(ur: 'America/New_York', flag: 'usa.png', location: 'New York'),
    WorldTime(ur: 'Europe/Berlin', flag: 'germany.png', location: 'Berlin'),
    WorldTime(ur: 'Asia/Kolkata', flag: 'india.png', location: 'Delhi'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //Navigate to the home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
