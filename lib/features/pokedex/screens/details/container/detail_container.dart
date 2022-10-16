import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/error/failure.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/common/widgets/po_error.dart';
import 'package:flutter_pokedex/common/widgets/po_loading.dart';
import 'package:flutter_pokedex/features/pokedex/screens/home/pages/home_loading.dart';

import '../../home/pages/home_error.dart';
import '../../home/pages/home_page.dart';
import '../pages/details_page.dart';

class DetailArguments{
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;

  
}


class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key, 
    required this.arguments, 
    required this.repository, required this.onBack}) : super(key: key);

  final iPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return PoLoading();
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return DetailPage(
            pokemon: arguments.pokemon, 
            list: snapshot.data!, onBack: onBack,
            
            );
        }

        if(snapshot.hasError){
          return PoError(error: (snapshot.error as Failure).message!);
        }
        return Container();
      },
    );
  }
}