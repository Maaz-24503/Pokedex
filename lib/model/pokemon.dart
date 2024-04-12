class Pokemon {
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String spawn_time;
  List<String> weakness;
  List<String> previous_evolution;
  List<String> next_evolution;

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
    num = json[num]??"";
    name = json['name'] ?? "";
    img = json['img'] ?? "";
    type = json['type'] ?? [];
    height = json['height'] ?? "";
    weight = json['weight'] ?? "";
    spawn_time = json['spawn_time'] ?? "";
    weakness = json['weaknesses'] ?? [];
    previous_evolution = json['prev_evolution'] ?? ["Just Hatched"];
    next_evolution = json['next_evolution'] ?? ["Maxed Out"];
  }
}
