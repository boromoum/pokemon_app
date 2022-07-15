import 'package:flutter/material.dart';
import 'package:pokemon_app/api/services.dart';
import 'package:pokemon_app/bloc/pokemons/bloc.dart';
import 'package:pokemon_app/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Kanit"),
      home: BlocProvider(
        create: (context) => PokemonsBloc(pokemonsRepo: PokemonsServices()),
        child: HomeScreen(),
      ),
    );
  }
}
