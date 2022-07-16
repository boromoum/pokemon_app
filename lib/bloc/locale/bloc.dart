import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:meta/meta.dart';

part 'states.dart';

class LocaleBloc extends Cubit<LocaleState> {
  LocaleBloc() : super(SelectedLocale(Locale('en')));

  void toKhmer() => emit(SelectedLocale(Locale('km')));

  void toEnglish() => emit(SelectedLocale(Locale('en')));
}
