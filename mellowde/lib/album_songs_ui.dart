import 'package:flutter/material.dart';
import 'package:mellowde/album_component.dart';
import 'package:mellowde/models/album.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/song_component.dart';

class AlbumSongScreen extends StatefulWidget {
  const AlbumSongScreen({super.key});

  @override
  State<AlbumSongScreen> createState() => _AlbumSongScreenState();
}

class _AlbumSongScreenState extends State<AlbumSongScreen> {
  final List<Song> _songs = [
    Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
        "assets/audio/BasketCase.mp3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Albumo pavadinimas",
          style:
              TextStyle(color: Colors.black, fontFamily: "Karla", fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ..._songs.map((e) => SongComponent(song: e, type: "edit")),
            ],
          ),
        ),
      ),
    );
  }
}
