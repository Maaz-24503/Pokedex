import 'package:flutter/material.dart';
import 'package:pokedex/service/poke_service.dart';
import '../model/pokemon.dart';

class PokeProvider extends ChangeNotifier {
  final _service = PokeService();
  bool isLoading = false;
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;
  Future<void> getAllUsers() async{
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllPokemons();
    _pokemons = response;
    print("asjhkbdaskjbdaksjbdkasjbda");
    isLoading = false;
    notifyListeners();
  }
}