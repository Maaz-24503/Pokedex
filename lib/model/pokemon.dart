import 'package:flutter/material.dart';

class Pokemon {
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? spawn_time;
  List<String>? weakness;
  List? previous_evolution;
  List? next_evolution;
  Color? color;
  Map<String, Color> colors = {
    'Normal': Colors.grey[300]!,
    'Fire': Colors.redAccent,
    'Water': const Color.fromARGB(255, 64, 156, 255),
    'Electric': Colors.amberAccent,
    'Grass': const Color(0xFF00F4A8),
    'Ice': Colors.cyanAccent,
    'Fighting': Colors.deepOrangeAccent,
    'Poison': Colors.purpleAccent,
    'Ground': Colors.brown[400]!,
    'Flying': Colors.blueGrey[200]!,
    'Psychic': Colors.pinkAccent,
    'Bug': const Color.fromARGB(178, 239, 255, 65),
    'Rock': Colors.grey[500]!,
    'Ghost': Colors.indigoAccent,
    'Dragon': Colors.deepPurpleAccent,
    'Dark': Colors.black,
    'Steel': Colors.blueGrey[600]!,
    'Fairy': Colors.pinkAccent[100]!,
  };

  Pokemon(
      {required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.spawn_time,
      required this.weakness,
      required this.previous_evolution,
      required this.next_evolution});

  Pokemon.fromJSON(Map<String, dynamic> json) {
    num = json['num'] ?? "";
    name = json['name'] ?? "";
    img = json['img'] ?? "";
    type = List<String>.from(json['type']);
    height = json['height'] ?? "";
    weight = json['weight'] ?? "";
    spawn_time = json['spawn_time'] ?? "";
    weakness = List<String>.from(json['weaknesses']) ?? [];
    previous_evolution = json['prev_evolution'] != null
        ? json['prev_evolution'].map((e) => e['name']).toList()
        : ["Just Hatched"];
    next_evolution = json['next_evolution'] != null
        ? json['next_evolution'].map((e) => e['name']).toList()
        : ["Maxed Out"];
    color = colors.containsKey(type![0])
        ? colors[json['type'][0]]
        : const Color.fromARGB(96, 255, 250, 250);
    // color = colors[json['type'][0]];
  }
}
