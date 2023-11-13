import 'package:flutter/material.dart';
import 'package:mellowde/add_to_playlsit_ui.dart';
import 'package:mellowde/main_screen_ui.dart';
import 'package:mellowde/models/album.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/song_component.dart';

class SongSearch extends StatefulWidget {
  const SongSearch({super.key});

  @override
  State<SongSearch> createState() => _SongSearchState();
}

class _SongSearchState extends State<SongSearch> {
  final List<Song> _songs = [
    Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
        "assets/audio/BasketCase.mp3"),
  ];
  final List<Album> _albums = [
    Album("album", "author", ""),
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
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: Image.asset("assets/logo.png"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),
            ),
            elevation: 0,
            backgroundColor: const Color(0x00000000),
            title: Center(
              child: SizedBox(
                height: 38,
                width: 300,
                child: TextField(
                  onChanged: (value) => onSearch(value),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.black45),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    hintText: "Search..",
                  ),
                ),
              ),
            )),
        body: Container(
            child: ListView.builder(
          padding: const EdgeInsets.only(right: 20, left: 20),
          itemCount: _songs.length,
          itemBuilder: (context, index) {
                    return GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPlaylist()),
                          );
                        },
                        child: SongComponent(song: _songs[index], type: "play",));
                  },
        )));
  }

  onSearch(String prompt) {}
}
