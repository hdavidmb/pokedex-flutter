import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';
import 'package:pokedex_flutter/core/presentation/widgets/types_wrap/types_wrap.dart';

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
      color: backgroundColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            height: size,
            width: double.infinity,
            child: _BodyStack(),
          ),
          _TabBar()
        ],
      ),
    );
  }
}

class _BodyStack extends StatelessWidget {
  const _BodyStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dottedWidh = 100;
    double stackWidth = MediaQuery.of(context).size.width;
    double stackHigh = MediaQuery.of(context).size.height;

    print(stackHigh);
    print(stackWidth);
    return Stack(
      children: [
        Positioned(
          top: 160,
          right: 0,
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.1)
                  ],
                  stops: [
                    0.0,
                    1.0
                  ]).createShader(rect);
            },
            child: Image(
              image: AppImages.dotted,
              width: dottedWidh,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 20,
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return RadialGradient(
                // center: Alignment.bottomRight,
                // focal: Alignment.topLeft,
                center: Alignment.topLeft,
                focal: Alignment.bottomRight,
                radius: 1.009,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.2),
                  Colors.transparent,
                ],
                stops: [
                  0.0,
                  2.0,
                  3.0,
                ],
              ).createShader(rect);
            },
            child: Image(
              image: AppImages.pokeball,
              width: 150,
              color: Colors.white,
            ),
          ),
        ),
        _BodyPokeCard(),
      ],
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
  final Types type = Types.fire;

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
              TypesWrap(types: [type])
            ],
          ),
        )
      ],
    );
  }
}

class _TabBar extends StatefulWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  __TabBarState createState() => __TabBarState();
}

class __TabBarState extends State<_TabBar> {
  int selectedTab = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  selectTab(int tabNumber) {
    if (tabNumber == this.selectedTab) return;

    setState(() {
      this.selectedTab = tabNumber;
      _pageController.animateToPage(
        tabNumber,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  onPageVieweChangePage(int tabNumber) {
    setState(() {
      this.selectedTab = tabNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return _PageViewer();
    return Expanded(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Tab(
                    name: "About",
                    tabNumber: 0,
                    selectedTab: selectedTab,
                    onTap: selectTab),
                _Tab(
                    name: "Stats",
                    tabNumber: 1,
                    selectedTab: selectedTab,
                    onTap: selectTab),
                _Tab(
                  name: "Evolution",
                  tabNumber: 2,
                  selectedTab: selectedTab,
                  onTap: selectTab,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: PageView(
                onPageChanged: onPageVieweChangePage,
                controller: _pageController,
                children: [
                  Container(
                    child: Text("About"),
                  ),
                  Container(
                    child: Text("Stats"),
                  ),
                  Container(
                    child: Text("Evolution"),
                  ),
                ],
              ),
            ),
          )
          //_PageViewer()
        ],
      ),
    );
  }
}

class _PageViewer extends StatelessWidget {
  const _PageViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: PageView(
          children: [Center(child: Text("Hi"))],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String name;
  final int tabNumber;
  final int selectedTab;
  final void Function(int number) onTap;

  const _Tab({
    Key? key,
    required this.name,
    required this.tabNumber,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(tabNumber);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
        alignment: Alignment.center,
        width: 120,
        height: 70,
        decoration: selectedTab == tabNumber
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/half-pokeball-2.png'),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2),
                      BlendMode.dstATop), //7 Ver notas
                ),
              )
            : null,

        //color: selectedTab == tabNumber ? Colors.blue : Colors.transparent,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selectedTab == tabNumber ? Colors.white : Colors.white30,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
