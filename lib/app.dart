import 'package:flutter_app/utils/bird_pos.dart';
import 'package:flutter_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => BirdPos(),
        child: HomeScreen(),
      ),
    );
  }
}
