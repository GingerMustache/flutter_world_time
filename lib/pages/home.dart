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
    // String bgImage = data["isDaytime"] ? "day.jpg" : "night.jpg";

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/night.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120, 0.0, 0.0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: const Icon(Icons.edit_location),
                label: const Text("Edit location"),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data["time"],
                style: const TextStyle(fontSize: 66.0),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
