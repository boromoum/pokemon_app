// event, state => new state => update UI.

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/api/exceptions.dart';
import 'package:pokemon_app/api/services.dart';
import 'package:pokemon_app/bloc/pokemons/events.dart';
import 'package:pokemon_app/bloc/pokemons/states.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonsBloc extends Bloc<PokemonEvents, PokemonsState> {
  final PokemonsRepo? pokemonsRepo;
  List<Pokemon>? pokemons;

  PokemonsBloc({this.pokemonsRepo}) : super(PokemonsInitState()) {
    on<PokemonEvents>(_onGetAllPokemons);
  }

  Future<void> _onGetAllPokemons(
    PokemonEvents event,
    Emitter<PokemonsState> emit,
  ) async {
    try {
      emit(PokemonsLoading());

      final pokemons = await pokemonsRepo?.getPokemonList();
      emit(PokemonsLoaded(pokemons: pokemons));
    } on SocketException {
      PokemonsListError(
        error: NoInternetException('No Internet'),
      );
    } on HttpException {
      PokemonsListError(
        error: NoServiceFoundException('No Service Found'),
      );
    } on FormatException {
      PokemonsListError(
        error: InvalidFormatException('Invalid Response format'),
      );
    } catch (e) {
      PokemonsListError(
        error: UnknownException('Unknown Error'),
      );
    }
  }
}
