import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpg'),
  ];

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
        // вывод листа в столбик
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
          child: ListView.builder(
            itemCount: locations.length,
            // функцияя идут по всему листу и что то возвращаяет
            itemBuilder: (context, index) {
              // возврат итерируемы карточек с названием title и иконкой leading
              return Card(
                child: ListTile(
                  onTap: () {
                    print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("images/${locations[index].flag}"),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
