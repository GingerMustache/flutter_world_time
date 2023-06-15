import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // получаем аргументы в виде Map data из loading.dart
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set a background
    String bgImage = data["isDayTime"] ? "day.jpg" : "night.jpg";

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 345, 0.0, 0.0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: const Icon(
                  Icons.edit_location,
                ),
                label: Text(
                  "Edit location",
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 15.0),
              Text(
                data["time"],
                style: const TextStyle(fontSize: 50.0, color: Colors.white),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
