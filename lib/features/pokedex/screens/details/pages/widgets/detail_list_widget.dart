import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({ Key? key, required this.pokemon, required this.list, required this.controller, required this.onChangePokemon}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;


  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: 80,
              left: 0,
              right: 0,
              height: 350,
              child: Container(
                color:pokemon.baseColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Flexible(
                        child: Text(
                          pokemon.name, 
                            style: const TextStyle(
                              fontSize: 38, 
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              ),
                            ),
                      ),
                      Text('#${pokemon.num}', 
                        style: const TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          ),
                        )
                    ],),
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: PageView(
                      onPageChanged: (index) => onChangePokemon(list[index]),
                      controller: controller,
                      children:
                        list.map((e) => 
                        Image.network(
                          e.image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                          ).toList(),
                     
                    ),
                    ),
            ],    
          ),
       ),
    );
  }
}