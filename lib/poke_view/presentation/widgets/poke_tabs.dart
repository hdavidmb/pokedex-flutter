import 'package:flutter/material.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_tab.dart';

import 'about_view.dart';

class PokeTabBar extends StatefulWidget {
  const PokeTabBar({Key? key}) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<PokeTabBar> {
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
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: PageView(
                onPageChanged: onPageVieweChangePage,
                controller: _pageController,
                children: [
                  Container(
                    child: AboutPage(),
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
