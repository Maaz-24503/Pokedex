import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/screens/poke_detail.dart';
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
            title: const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                "Pokedex",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 108, 107, 107)),
              ),
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
                    childAspectRatio: 1.4),
                padding: const EdgeInsets.all(8.0), // padding around the grid
                itemCount: pokemons.length, // total number of items
                itemBuilder: (context, index) {
                  final Pokemon pokemon = pokemons[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PokeDetail(pokemon: pokemon);
                        },
                      ));
                    },
                    child: Card(
                      color: pokemon.color,
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, right: 8.0),
                                child: SizedBox(
                                    height: 90,
                                    child: Hero(
                                        tag: pokemon.img!,
                                        child: Image.network(pokemon.img!))),
                              )),
                          Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, left: 15),
                              child: Text(
                                pokemon.name!,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.transparent.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0, vertical: 1.0),
                                    child: Text(pokemon.type![0],
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            )
                          ])
                        ],
                      ),
                    ),
                  );
                });
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