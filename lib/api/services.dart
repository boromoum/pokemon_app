import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokemon_app/models/pokemon.dart';

abstract class PokemonsRepo {
  Future<List<Pokemon>> getPokemonList();
}

class PokemonsServices implements PokemonsRepo {
  static const _baseUrl = 'gist.githubusercontent.com';
  static const String _GET_POKEMONS =
      '/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  @override
  Future<List<Pokemon>> getPokemonList() async {
    Uri uri = Uri.https(_baseUrl, _GET_POKEMONS);
    Response response = await http.get(uri);
    List<Pokemon> pokemons = pokemonFromJson(response.body);
    print("pokemons: ${pokemons.length}");
    return pokemons;
  }
}
