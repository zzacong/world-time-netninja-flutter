import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final locations = [
    WorldTime(region: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(region: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(region: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(region: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(region: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        region: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(region: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        region: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(
        region: 'Australia/Melbourne',
        location: 'Melbourne',
        flag: 'australia.png'),
  ];

  void updateTime(int i) async {
    WorldTime w = locations[i];
    await w.getTime();
    // navigate back to home screen
    Navigator.pop(context, w);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('Choose a location'),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 4,
                  ),
                  child: Card(
                    child: ListTile(
                      onTap: () => updateTime(i),
                      title: Text(locations[i].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${locations[i].flag}'),
                      ),
                    ),
                  ),
                )));
  }
}
