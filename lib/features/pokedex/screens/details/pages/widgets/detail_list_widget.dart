import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({ Key? key, required this.pokemon, required this.list }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
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
                  PageView()
            ],    
          ),
       ),
    );
  }
}