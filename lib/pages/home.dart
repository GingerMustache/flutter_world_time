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
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)!.settings.arguments as Map;
    bool isMapEmpty = data!.isEmpty;
    if (isMapEmpty) {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    }

    // set a background image
    String bgImage = data["isDayTime"] ? "day.jpg" : "night.jpg";
    // set a background color
    Color? bgColor = data["isDayTime"]
        ? const Color.fromARGB(255, 36, 129, 144)
        : const Color.fromARGB(255, 35, 118, 121);

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
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if (result != null) {
                      data = result;
                    }
                  });
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 177, 125, 42),
                ),
                label: const Text(
                  "Edit location",
                  style: TextStyle(color: Color.fromARGB(255, 177, 125, 42)),
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
