import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/favorite_screen/favorite_ui.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return FavoriteUI();
  }
}
