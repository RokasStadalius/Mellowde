import 'package:flutter/material.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/profile_image_container.dart';
import 'package:mellowde/song_component.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

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
                      height: 20,
                    ),
                    const Center(
                        child: ProfileImageContainer(
                            imagePath: "", width: 100, height: 100)),
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text("Name",
                          style: TextStyle(
                              fontFamily: "Karla",
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Text("Bio",
                        style: TextStyle(
                            fontFamily: "Karla",
                            fontSize: 30,
                            color: Colors.black)),
                    const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
                            fontFamily: "Karla", color: Colors.black)),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text("Songs",
                        style: TextStyle(
                            fontFamily: "Karla",
                            fontSize: 30,
                            color: Colors.black)),
                    ...songs.map((e) => SongComponent(song: e))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
