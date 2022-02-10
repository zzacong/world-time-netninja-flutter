import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as WorldTime;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/location'),
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit location'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data.location,
                      style: const TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                data.time ?? '',
                style: const TextStyle(fontSize: 66),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
