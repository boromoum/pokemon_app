import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
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
                      const Tab(text: "About"),
                      const Tab(text: "Base Stats"),
                      const Tab(text: "Evolutions"),
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
                                'About',
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
                                        'Height',
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
                                        'Weight',
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
                                'Breeding',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Row(children: [
                                Text(
                                  'Gender',
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
                                'Training',
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
                        Container(color: Colors.transparent),
                        Container(color: Colors.transparent),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
