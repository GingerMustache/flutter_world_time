import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  late String time; // the time in that location
  String flag; // url to an assert flag icon
  String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties of data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      // create DateTime obj
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      // time = now.toString();
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught some error, the error is - $e");
      time = "could not get time data";
    }
  }
}
