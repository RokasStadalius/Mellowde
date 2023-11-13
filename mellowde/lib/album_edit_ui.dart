import 'package:flutter/material.dart';
import 'package:mellowde/album_edit_ui_songs.dart';
import 'package:mellowde/image_container.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/profile_image_container.dart';
import 'package:mellowde/song_component.dart';

class AlbumEditUi extends StatefulWidget {
  const AlbumEditUi({super.key});

  @override
  State<AlbumEditUi> createState() => _AlbumEditUiState();
}

class _AlbumEditUiState extends State<AlbumEditUi> {
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
          actions: [
            PopupMenuButton<String>(
              onSelected: (selectChoice) {},
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'albumedit',
                    child: Text('Edit an album'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 3',
                    child: Text('Option 3'),
                  ),
                ];
              },
            ),
          ],
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
                      height: 20,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x007e5496).withOpacity(1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.deepPurple.withOpacity(0.15),
                              ),
                            ),
                            hintStyle: const TextStyle(
                              fontFamily: "Karla",
                              fontSize: 20,
                              color: Colors.white54,
                            ),
                            hintText: "Name...",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: const StadiumBorder(),
                          backgroundColor:
                              const Color(0x007e5496).withOpacity(1),
                        ),
                        child: const Text(
                          'Select Cover',
                          style: TextStyle(fontFamily: "Karla"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: ImageContainer(
                        height: 200,
                        width: 200,
                        imagePath: "",
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AlbumEditUISongs()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(fontFamily: "Karla"),
                          ),
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
