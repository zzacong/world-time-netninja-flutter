import 'dart:convert';

import 'package:http/http.dart' as http;

class WorldTime {
  final String baseUrl = 'https://worldtimeapi.org/api/timezone/';

  String location; // location name for the UI
  String? time; // the time in that location
  String flag; // url to an asset flag icon
  String region; // timezone region

  WorldTime({required this.location, required this.flag, required this.region});

  Future<void> getTime() async {
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
    time = now.toString();
  }
}
