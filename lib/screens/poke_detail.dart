import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class PokeDetail extends StatefulWidget {
  final Pokemon pokemon;
  const PokeDetail({super.key, required this.pokemon});
  @override
  State<PokeDetail> createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = widget.pokemon;
    return SafeArea(
        child: Scaffold(
      backgroundColor: pokemon.color,
      appBar: AppBar(
        backgroundColor: pokemon.color,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        pokemon.name!,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      '#${pokemon.num!}',
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 3.0),
                    child: Text(pokemon.type!.map((e) => e).join(", "),
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Name",
                                style: TextStyle(color: Color(0xFF79878F)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Height",
                                  style: TextStyle(color: Color(0xFF79878F))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Weight",
                                  style: TextStyle(color: Color(0xFF79878F))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Spawn",
                                  style: TextStyle(color: Color(0xFF79878F))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Weakness",
                                  style: TextStyle(color: Color(0xFF79878F))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Pre Evolution",
                                  style: TextStyle(color: Color(0xFF79878F))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Next Evolution",
                                  style: TextStyle(color: Color(0xFF79878F))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(pokemon.name!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(pokemon.height!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(pokemon.weight!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(pokemon.spawn_time!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                pokemon.weakness!.map((e) => e).join(", "),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                pokemon.previous_evolution!
                                    .map((e) => e)
                                    .join(", "),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                pokemon.next_evolution!
                                    .map((e) => e)
                                    .join(", "),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.5- 100, top:MediaQuery.of(context).size.width*0.5- 100),
            child: SizedBox(
                height: 220,
                child: Hero(
                    tag: pokemon.img!,
                    child: Image.network(
                      pokemon.img!,
                      fit: BoxFit.cover,
                    ))),
          )
        ],
      ),
    ));
  }
}
