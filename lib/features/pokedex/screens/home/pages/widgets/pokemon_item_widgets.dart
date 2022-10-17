import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/widgets/type_widgetd.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({Key? key, 
  required this.pokemon, 
  required this.onTap, required this.index,}) : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon, index: index)),
      child: Stack(
        children: [
        Container(
          decoration: BoxDecoration(color: pokemon.baseColor!.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16)      
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Flexible(
                      child: Text(pokemon.name, 
                        style: const TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 16),),
                    ),
                    Text('#${pokemon.num}', 
                        style: const TextStyle(
                          color: Colors.black, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 14),),
                    ],
                    ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                      pokemon.type.map((e) => TypeWidget(name: e,)).toList(),
                  ),
                  Flexible(child: Container(
                    height: 100,
                    width: 100,
                  ))
                  ],
                )
            ]),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 2,
          child: Image.network(pokemon.image,
          ),
        ),
        ],
      ),
    );
  }
}