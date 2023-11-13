import 'package:flutter/material.dart';
import 'package:mellowde/album_component.dart';
import 'package:mellowde/models/album.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/song_component.dart';

class SelectAlbumEditUI extends StatefulWidget {
  const SelectAlbumEditUI({super.key});

  @override
  State<SelectAlbumEditUI> createState() => _SelectAlbumEditUIState();
}

class _SelectAlbumEditUIState extends State<SelectAlbumEditUI> {
  final List<Album> songs = [
    Album("Album1", "Author1", ""),
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
          "Select Album To Edit",
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
              ...songs.map((e) => AlbumComponent(album: e, type: "edit")),
            ],
          ),
        ),
      ),
    );
  }
}
