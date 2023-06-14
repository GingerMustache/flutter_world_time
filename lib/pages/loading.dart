import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  //sample
  // void getData() async {x
  // Response response =
  //     await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  // Map data = jsonDecode(response.body); // декодироввка json и перевод в мапу
  // }

  @override
  // всегда отрабатывает вперед build
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
