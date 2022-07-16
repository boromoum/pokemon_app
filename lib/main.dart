import 'package:flutter/material.dart';
import 'package:pokemon_app/api/services.dart';
import 'package:pokemon_app/bloc/locale/bloc.dart';
import 'package:pokemon_app/bloc/pokemons/bloc.dart';
import 'package:pokemon_app/localization/app_localizations_setup.dart';
import 'package:pokemon_app/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                PokemonsBloc(pokemonsRepo: PokemonsServices())),
        BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Kanit"),
            home: HomeScreen(),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            locale: localeState.locale,
          );
        },
      ),
    );
  }
}
