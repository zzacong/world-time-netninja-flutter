import 'dart:convert';
import 'dart:developer' as d;

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

class WorldTime {
  final String baseUrl = 'https://worldtimeapi.org/api/timezone/';

  final String location; // location name for the UI
  final String flag; // url to an asset flag icon
  final String region; // timezone region
  String? time; // the time in that location
  bool isDay = true; // daytime or nighttime

  WorldTime({required this.location, required this.flag, required this.region});

  Future<void> getTime() async {
    // Simulate network request for a username
    // String username =
    //     await Future.delayed(const Duration(milliseconds: 3000), () {
    //   return 'yoshi';
    // });

    try {
      // make the request
      var url = Uri.parse('$baseUrl$region');
      var res = await http.get(url);
      Map data = jsonDecode(res.body);
      // print(data)

      // get the properties
      var datetime = data['datetime'];
      var offset = data['utc_offset'].substring(0, 3);

      // create DateTime object
      var now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDay = now.hour > 6 && now.hour < 20;
      time = intl.DateFormat.jm().format(now);
    } catch (e) {
      d.log('error: $e');
      time = 'could not get time data';
    }
  }
}
