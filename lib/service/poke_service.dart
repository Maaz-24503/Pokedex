import 'dart:convert';

import '../model/pokemon.dart';
import 'package:dio/dio.dart';

class PokeService {
  Future<List<Pokemon>> getAllPokemons() async {
    final dio = Dio();
    final response =
        await dio.get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    print(response.data);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final List<Pokemon> users = json['pokemon'].map<Pokemon>((e) {
        return Pokemon.fromJSON(json);
      }).toList();
      print(users);
      return users;
    } else {
      throw Exception();
    }
  }
}
