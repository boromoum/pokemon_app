import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/locale/bloc.dart';
import 'package:pokemon_app/bloc/pokemons/bloc.dart';
import 'package:pokemon_app/bloc/pokemons/states.dart';
import 'package:pokemon_app/localization/app_localizations.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/screens/detail_screen/detail_screen.dart';
import 'package:pokemon_app/widgets/error.dart';
import 'package:pokemon_app/widgets/item_card.dart';
import 'package:pokemon_app/widgets/loading.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key, this.loadPokemons}) : super(key: key);
  final VoidCallback? loadPokemons;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white.withOpacity(0.7),
                pinned: true,
                expandedHeight: height * 0.15,
                // collapsedHeight: height * 0.075,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    double appBarHeight = constraints.biggest.height;
                    bool isExpanded = appBarHeight > height * 0.2;
                    return FlexibleSpaceBar(
                      titlePadding: EdgeInsets.zero,
                      title: SizedBox(
                        height: height * 0.15,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: isExpanded
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    padding: isExpanded
                                        ? EdgeInsets.only(left: 10)
                                        : EdgeInsets.all(20),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate("pokemons"),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: IconButton(
                                  icon: Icon(Icons.translate),
                                  onPressed: () {
                                    if (AppLocalizations.of(context)!
                                        .isEnLocale) {
                                      BlocProvider.of<LocaleBloc>(context)
                                          .toKhmer();
                                    } else {
                                      BlocProvider.of<LocaleBloc>(context)
                                          .toEnglish();
                                    }
                                  },
                                ),
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<PokemonsBloc, PokemonsState>(
                builder: (BuildContext context, PokemonsState state) {
                  if (state is PokemonsListError) {
                    final error = state.error;
                    String message = '${error.message}\nTap to Retry.';
                    return SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ErrorTxt(
                          message: message,
                          onTap: loadPokemons,
                        ),
                      ),
                    );
                  }
                  if (state is PokemonsLoaded) {
                    List<Pokemon>? pokemons = state.pokemons;
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.1,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          Pokemon pokemon = pokemons![index];
                          return Container(
                            margin: index % 2 == 0
                                ? EdgeInsets.only(left: 20)
                                : EdgeInsets.only(right: 20),
                            child: ItemCard(
                              pokemon: pokemon,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (DetailScreen(
                                              pokemon: pokemon,
                                            ))));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Loading()));
                },
              ),
            ],
          ),
          // Positioned(
          //     bottom: 10,
          //     right: 10,
          //     child: RawMaterialButton(
          //       onPressed: () {},
          //       elevation: 2.0,
          //       fillColor: Colors.white,
          //       child: Icon(
          //         Icons.favorite_border_outlined,
          //         size: 35.0,
          //       ),
          //       padding: EdgeInsets.all(15.0),
          //       shape: CircleBorder(),
          //     ))
        ],
      ),
    );
  }
}
