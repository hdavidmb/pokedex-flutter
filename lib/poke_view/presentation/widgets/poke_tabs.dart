import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/core/presentation/widgets/loaders/pika_loading.dart';
import 'package:pokedex_flutter/poke_view/application/poke_state.dart';
import 'package:pokedex_flutter/poke_view/application/poke_view_providers.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_tab.dart';

import 'about_view.dart';

class PokeTabBar extends StatefulWidget {
  const PokeTabBar({Key? key, required this.pokeName}) : super(key: key);
  final String pokeName;

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<PokeTabBar> {
  int selectedTab = 0;
  late PageController _pageController;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read(pokeViewNotifierProvider).fecthPokeData(widget.pokeName);
    });
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
                PokeTab(
                    name: "About",
                    tabNumber: 0,
                    selectedTab: selectedTab,
                    onTap: selectTab),
                PokeTab(
                    name: "Stats",
                    tabNumber: 1,
                    selectedTab: selectedTab,
                    onTap: selectTab),
                PokeTab(
                  name: "Evolution",
                  tabNumber: 2,
                  selectedTab: selectedTab,
                  onTap: selectTab,
                ),
              ],
            ),
          ),
          Expanded(
            child: ContentTabs(
              pokeName: widget.pokeName,
              onPageVieweChangePage: onPageVieweChangePage,
              pageController: _pageController,
            ),
          )
          //_PageViewer()
        ],
      ),
    );
  }
}

class ContentTabs extends StatelessWidget {
  final String pokeName;
  final Function(int tabNumber) onPageVieweChangePage;
  final PageController pageController;
  const ContentTabs(
      {Key? key,
      required this.onPageVieweChangePage,
      required this.pageController,
      required this.pokeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final provider = watch(pokeViewNotifierProvider);
      final pokeState = provider.pokeState;

      if (pokeState == PokeState.ready())
        return _tabsContent(pokeData: provider.pokeData);

      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: PikaLoader(),
        ),
      );
    });
  }

  Widget _tabsContent({required PokeData pokeData}) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: PageView(
        onPageChanged: onPageVieweChangePage,
        controller: pageController,
        children: [
          Container(
            child: AboutPage(
              pokeData: pokeData,
            ),
          ),
          Container(
            child: Text("Stats"),
          ),
          Container(
            child: Text("Evolution"),
          ),
        ],
      ),
    );
  }
}
