import 'package:flutter/material.dart';
import 'package:mellowde/album_component.dart';
import 'package:mellowde/models/album.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/profile_details_ui.dart';
import 'package:mellowde/song_component.dart';

class AlbumEditUISongs extends StatefulWidget {
  const AlbumEditUISongs({super.key});

  @override
  State<AlbumEditUISongs> createState() => _AlbumEditUISongsState();
}

class _AlbumEditUISongsState extends State<AlbumEditUISongs> {
  final List<Album> songs = [
    Album(
      "Basket Case",
      "Green Day",
      "assets/DookieGreenDay.png",
    ),
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
          "Edit Album Songs",
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
              ...songs.map((e) => AlbumComponent(
                    album: e,
                    type: "edit",
                  )),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileDetailsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontFamily: "Karla"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
