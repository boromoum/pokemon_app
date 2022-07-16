import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemon_app/localization/app_localizations.dart';
import 'package:pokemon_app/models/pokemon.dart';

class DetailUI extends StatelessWidget {
  const DetailUI(
      {Key? key,
      this.pokemon,
      this.bgColor,
      this.textColor,
      this.tabController})
      : super(key: key);
  final Pokemon? pokemon;
  final PaletteColor? bgColor;
  final Color? textColor;
  final TabController? tabController;
  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    backgroundColor:
                        bgColor != null ? bgColor!.color : Colors.white,
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                          centerTitle: true,
                          background: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.network(
                              pokemon!.imageurl ?? 'none',
                            ),
                          ));
                    })),
              ];
            },
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor:
                        bgColor != null ? bgColor!.color : Colors.black,
                    controller: tabController,
                    tabs: <Tab>[
                      Tab(
                          text:
                              AppLocalizations.of(context)!.translate("about")),
                      Tab(
                          text: AppLocalizations.of(context)!
                              .translate("base_stats")),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(children: [
                                Text(
                                  pokemon!.id ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  pokemon!.name ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                                ),
                              ]),
                              SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate("about"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Text(pokemon!.xdescription ?? '',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(height: 10),
                              Row(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate("height"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        pokemon!.height ?? '',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ]),
                                SizedBox(width: 30),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate("weight"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        pokemon!.weight ?? '',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ]),
                              ]),
                              SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate("breeding"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Row(children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("gender"),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.male,
                                  color: Colors.lightBlue,
                                  size: 35,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  pokemon!.malePercentage ?? '',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.female,
                                  color: Colors.pinkAccent,
                                  size: 35,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  pokemon!.femalePercentage ?? '',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ]),
                              SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!
                                    .translate("training"),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Row(children: [
                                Text(
                                  'Base EXP',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  pokemon!.baseExp ?? '',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  AppLocalizations.of(context)!.translate("hp"),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                GFProgressBar(
                                  percentage: pokemon!.hp! / 100,
                                  lineHeight: 20,
                                  backgroundColor: Colors.grey,
                                  progressBarColor: bgColor != null
                                      ? bgColor!.color
                                      : Colors.black,
                                  trailing: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(pokemon!.hp!.toString())),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("attack"),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                GFProgressBar(
                                  percentage: pokemon!.attack! / 100,
                                  lineHeight: 20,
                                  backgroundColor: Colors.grey,
                                  progressBarColor: bgColor != null
                                      ? bgColor!.color
                                      : Colors.black,
                                  trailing: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(pokemon!.attack!.toString())),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("defense"),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                GFProgressBar(
                                  percentage: pokemon!.defense! / 100,
                                  lineHeight: 20,
                                  backgroundColor: Colors.grey,
                                  progressBarColor: bgColor != null
                                      ? bgColor!.color
                                      : Colors.black,
                                  trailing: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child:
                                          Text(pokemon!.defense!.toString())),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("special_attack"),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                GFProgressBar(
                                  percentage: pokemon!.specialAttack! / 100,
                                  lineHeight: 20,
                                  backgroundColor: Colors.grey,
                                  progressBarColor: bgColor != null
                                      ? bgColor!.color
                                      : Colors.black,
                                  trailing: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                          pokemon!.specialAttack!.toString())),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("special_defense"),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(height: 10),
                                GFProgressBar(
                                  percentage: pokemon!.specialDefense! / 100,
                                  lineHeight: 20,
                                  backgroundColor: Colors.grey,
                                  progressBarColor: bgColor != null
                                      ? bgColor!.color
                                      : Colors.black,
                                  trailing: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                          pokemon!.specialDefense!.toString())),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
