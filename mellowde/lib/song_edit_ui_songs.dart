import 'package:flutter/material.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/profile_details_ui.dart';
import 'package:mellowde/song_component.dart';

class SongEditUiSongs extends StatefulWidget {
  const SongEditUiSongs({super.key});

  @override
  State<SongEditUiSongs> createState() => _SongEditUiSongsState();
}

class _SongEditUiSongsState extends State<SongEditUiSongs> {
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
          "Edit Songs",
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
              ..._songs.map((e) => SongComponent(
                    song: e,
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
