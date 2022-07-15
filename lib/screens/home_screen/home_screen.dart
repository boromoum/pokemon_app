import 'package:flutter/material.dart';
import 'package:pokemon_app/bloc/pokemons/bloc.dart';
import 'package:pokemon_app/bloc/pokemons/events.dart';
import 'package:pokemon_app/screens/home_screen/home_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  _loadPokemons() async {
    context.read<PokemonsBloc>().add(PokemonEvents.fetchPokemons);
  }

  @override
  Widget build(BuildContext context) {
    return HomeUI(
      loadPokemons: _loadPokemons,
    );
  }
}
