import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemon_app/models/pokemon.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key, this.pokemon, this.onPressed}) : super(key: key);
  final Pokemon? pokemon;
  final VoidCallback? onPressed;
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  PaletteColor? bgColor;
  Color? textColor;
  @override
  void initState() {
    super.initState();
    _updatePalette();
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
        bgColor = PaletteColor(Colors.white, 3);
        textColor = Colors.black;
      });
    }
  }

  Widget getTypeWidgets(BuildContext context, List<String> strings) {
    return new Column(
        children: strings
            .map((item) => Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                alignment: Alignment.center,
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: new Text(
                  item,
                  style: TextStyle(fontSize: 10),
                )))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(10),
        color: bgColor != null ? bgColor!.color : Colors.white,
        elevation: 10,
        shadowColor: Colors.grey.shade300,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pokemon!.name ?? 'none',
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ],
                ),
                Text(
                  widget.pokemon!.id ?? 'none',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTypeWidgets(context, widget.pokemon!.typeofpokemon ?? []),
                Image.network(
                  widget.pokemon!.imageurl ?? 'error',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
