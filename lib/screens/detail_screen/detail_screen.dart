import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/screens/detail_screen/detail_ui.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon? pokemon;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  PaletteColor? bgColor;
  Color? textColor;
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _updatePalette();
    this._tabController = TabController(length: 3, vsync: this);
  }

  _updatePalette() async {
    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.pokemon!.imageurl!),
      size: Size(200, 100),
    );
    if (palette.darkMutedColor != null) {
      setState(() {
        bgColor = palette.darkMutedColor!;
        textColor = Colors.white;
      });
    } else {
      setState(() {
        bgColor = PaletteColor(Colors.black, 3);
        textColor = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DetailUI(
      pokemon: widget.pokemon,
      bgColor: bgColor,
      textColor: textColor,
      tabController: _tabController,
    );
  }
}
