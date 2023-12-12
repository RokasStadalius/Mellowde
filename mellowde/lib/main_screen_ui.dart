// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:mellowde/add_to_playlsit_ui.dart';
import 'package:mellowde/album_search_ui.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/playlist_ui.dart';
import 'package:mellowde/profile_details_ui.dart';
import 'package:mellowde/song_component.dart';
import 'package:mellowde/song_search_ui.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            if (newIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SongSearch()),
              );
            } else if (newIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AlbumSearchScreen()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: "Songs",
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albums")
          ],
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            const SizedBox(width: 1),
            IconButton(
              icon: Image.asset("assets/usericon.jpg"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileDetailsScreen()),
                );
              },
            ),
          ],
          //leading: Padding(
            //padding: const EdgeInsets.all(5.0),
            //child: IconButton(
              //icon: Image.asset("assets/logo.png"),
              //onPressed: () {},
            //),
          //),
          elevation: 0,
          backgroundColor: const Color(0x00000000),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: myPlaylists.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Playlist()),
                      );},
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
              const SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("History",
                      style: TextStyle(
                        fontFamily: "Karla",
                        fontSize: 40,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
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
                        child: SongComponent(
                          song: _songs[index],
                          type: "play"
                          ));
                  },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
