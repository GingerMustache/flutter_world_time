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
    Color? bgColor = data["isDayTime"]
        ? Color.fromARGB(255, 36, 129, 144)
        : Color.fromARGB(255, 35, 118, 121);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 445, 0.0, 0.0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.edit_location,
                  color: const Color.fromARGB(255, 177, 125, 42),
                ),
                label: const Text(
                  "Edit location",
                  style:
                      TextStyle(color: const Color.fromARGB(255, 177, 125, 42)),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[700]),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                data["time"],
                style: TextStyle(fontSize: 50.0, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
