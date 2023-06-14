import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // make the request
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);

    // get properties of data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);
    // print(dataTime);
    // print(offset);

    // create DateTime obj
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
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
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("loading screen"),
    );
  }
}
