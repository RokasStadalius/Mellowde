import 'package:flutter/material.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/profile_details_ui.dart';
import 'package:mellowde/song_component.dart';

class AlbumCreateSongAddScreen extends StatefulWidget {
  const AlbumCreateSongAddScreen({super.key});

  @override
  State<AlbumCreateSongAddScreen> createState() =>
      _AlbumCreateSongAddScreenState();
}

class _AlbumCreateSongAddScreenState extends State<AlbumCreateSongAddScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Song> songs = [
      Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
          "assets/audio/BasketCase.mp3"),
      Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
          "assets/audio/BasketCase.mp3"),
      Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
          "assets/audio/BasketCase.mp3"),
      Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
          "assets/audio/BasketCase.mp3"),
      Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
          "assets/audio/BasketCase.mp3"),
    ];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0x00000000),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/creationBG.png"),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor:
                              const Color(0x007e5496).withOpacity(1),
                        ),
                        child: const Text(
                          'Add a song',
                          style: TextStyle(fontFamily: "Karla"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    const Text("Songs",
                        style: TextStyle(
                            fontFamily: "Karla",
                            fontSize: 30,
                            color: Colors.black)),
                    ...songs.map((e) => SongComponent(song: e, type: "")),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileDetailsScreen()),
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
              )
            ],
          ),
        ));
  }
}
