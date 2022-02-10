import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime w = WorldTime(
        location: 'Berlin', flag: 'germany.png', region: 'Europe/Berlin');
    await w.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: w);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text('loading...'),
      ),
    );
  }
}
