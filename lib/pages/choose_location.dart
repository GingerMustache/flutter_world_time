import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    // simulate network request for username
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return "username";
    });

    // simulate network request for bio of username
    String bio = await Future.delayed(const Duration(seconds: 2), () {
      return "good man, but still not a woman";
    });

    print("username - $username\nbio - $bio");
  }

  @override
  // всегда отрабатывает вперед build
  void initState() {
    super.initState();
    getData();
    print("hey, there");
  }

  @override
  Widget build(BuildContext context) {
    print("build function run");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("choose a location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text(counter.toString()),
      ),
    );
  }
}
