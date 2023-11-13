import 'package:flutter/material.dart';
import 'package:mellowde/add_to_playlsit_ui.dart';
import 'package:mellowde/forgot_pass_ui.dart';
import 'package:mellowde/main_screen_ui.dart';
import 'package:mellowde/playlist_create_ui.dart';
import 'package:mellowde/playlist_edit_ui.dart';
import 'package:mellowde/profile_details_ui.dart';
import 'package:mellowde/song_creation_coverpic_ui.dart';
import 'package:mellowde/song_creation_namebio_ui.dart';
import 'package:mellowde/song_playing_ui.dart';
import 'package:mellowde/song_search_ui.dart';
import 'package:mellowde/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WelcomeScreen());
  }
}
