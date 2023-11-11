import 'package:flutter/material.dart';
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
            title: Center(
              child: Container(
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
          padding: EdgeInsets.only(right: 20, left: 20),
          itemCount: _songs.length,
          itemBuilder: (context, index) {
            return SongComponent(song: _songs[index]);
          },
        )));
  }

  onSearch(String prompt) {}
}
