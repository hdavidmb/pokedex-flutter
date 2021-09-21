import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';

class PokeTab extends StatelessWidget {
  final String name;
  final int tabNumber;
  final int selectedTab;
  final void Function(int number) onTap;

  const PokeTab({
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
      child: Container(
        width: 120,
        height: 70,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (selectedTab == tabNumber)
              ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.05)
                    ],
                    stops: const [0.0, 1.0],
                  ).createShader(rect);
                },
                child: const Image(
                  image: AppImages.half_pokeBall,
                ),
              ),
            Text(name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      selectedTab == tabNumber ? Colors.white : Colors.white30,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
