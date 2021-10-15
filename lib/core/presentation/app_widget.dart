import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/presentation/pages/home_page.dart';

class AppWidget extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      AppImages.precacheAssets(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
