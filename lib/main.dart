import 'package:flutter/material.dart';
import 'package:uno/screens/create_game_screen.dart';
import 'package:uno/screens/create_user_screen.dart';
import 'package:uno/screens/game_screen.dart';
import 'package:uno/screens/home_screen.dart';
import 'package:uno/screens/lobby_screen.dart';
import 'package:uno/screens/search_game_screen.dart';
import 'package:uno/screens/tutorial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        CreateGameScreen.routeName: (ctx) => const CreateGameScreen(),
        TutorialScreen.routeName: (ctx) => const TutorialScreen(),
        SearchGameScreen.routeName: (ctx) => const SearchGameScreen(),
        CreateUserScreen.routeName: (ctx) => CreateUserScreen(),
        LobbyScreen.routeName: (ctx) => LobbyScreen(),
        GameScreen.routeName: (ctx) => const GameScreen(),
      },
    );
  }
}
