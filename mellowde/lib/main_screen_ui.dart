// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mellowde/add_to_playlsit_ui.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/playlist_ui.dart';
import 'package:mellowde/song_component.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> myPlaylists = [
    "Playlist 1",
    "Playlist 2",
    "Playlist 3",
    "Playlist 4",
    "Playlist 5",
    "Playlist 6",
    "Playlist 7",
    "Playlist 8",
    "Playlist 9",
    "Playlist 10"
  ];
  final List<Song> _songs = [
    Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
        "assets/audio/BasketCase.mp3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(width: 1),
            IconButton(
              icon: Image.asset("assets/usericon.jpg"),
              onPressed: () {},
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.all(5.0),
            child: IconButton(
              icon: Image.asset("assets/logo.png"),
              onPressed: () {},
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0x00000000),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: myPlaylists.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Playlist()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                      height: 150,
                      width: 130,
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          myPlaylists[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Karla",
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("History",
                      style: TextStyle(
                        fontFamily: "Karla",
                        fontSize: 40,
                      ))),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: 500), // Set a maximum height for the song list
                  child: ListView.builder(
                    itemCount: _songs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPlaylist()),
                          );
                        },
                        child: SongComponent(song: _songs[index]));
                  },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
