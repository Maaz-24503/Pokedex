import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:provider/provider.dart';

import '../provider/poke_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokeProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            title: const Text(
              "Pokedex",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 108, 107, 107)),
            )),
        body: Consumer<PokeProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final pokemons = value.pokemons;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.all(8.0), // padding around the grid
                itemCount: pokemons.length, // total number of items
                itemBuilder: (context, index) {
                  return Card(
                    
                    child: Text(pokemons[index].num),
                  );
                });
            // return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

// Consumer<PokeProvider>(
//                 builder: (context, value, child) {
//                   if (value.isLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   final pokemons = value.pokemons;
//                   return GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, // number of items in each row
//                         mainAxisSpacing: 8.0, // spacing between rows
//                         crossAxisSpacing: 8.0,
//                       ),
//                       padding: const EdgeInsets.all(8.0), // padding around the grid
//                       itemCount: pokemons.length, // total number of items
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: Text(pokemons[index].num),
//                         );
//                       });
//                   // return const Center(child: CircularProgressIndicator());
//                 },
//               )

// Text(
//                     "Pokedex",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.left,
//                   )