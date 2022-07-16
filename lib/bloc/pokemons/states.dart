import 'package:equatable/equatable.dart';
import 'package:pokemon_app/models/pokemon.dart';

abstract class PokemonsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PokemonsInitState extends PokemonsState {}

class PokemonsLoading extends PokemonsState {}

class PokemonsLoaded extends PokemonsState {
  final List<Pokemon>? pokemons;
  PokemonsLoaded({this.pokemons});
}

class PokemonsListError extends PokemonsState {
  final error;
  PokemonsListError({this.error});
}
