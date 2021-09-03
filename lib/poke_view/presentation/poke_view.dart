import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';

class PokeInfoView extends StatelessWidget {
  const PokeInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  final size = 300.0;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFFfba556);

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            height: size,
            width: double.infinity,
            color: backgroundColor,
            child: Center(child: _BodyPokeCard()),
          ),
          _TabBar()
        ],
      ),
    );
  }
}

class _BodyPokeCard extends StatelessWidget {
  const _BodyPokeCard({Key? key}) : super(key: key);

  //sprites -> other -> official-artwork -> front-default
  final String imageUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png';

  final String id = "#004";
  final String name = "Charmander";
  final String type = "fire";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          )),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(type)
            ],
          ),
        )
      ],
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Expanded(
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(
                child: _TabContainer(
                  name: "About",
                ),
              ),
              Tab(
                child: _TabContainer(
                  name: "Stats",
                ),
              ),
              Tab(
                child: _TabContainer(
                  name: "Evolution",
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("It's cloudy here"),
              ),
              Center(
                child: Text("It's rainy here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabContainer extends StatelessWidget {
  final String name;
  final bool isSelected;

  const _TabContainer({Key? key, required this.name, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
