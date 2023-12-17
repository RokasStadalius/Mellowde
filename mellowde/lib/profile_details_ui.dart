import 'package:flutter/material.dart';
import 'package:mellowde/album_create_ui.dart';
import 'package:mellowde/album_edit_ui.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/profile_image_container.dart';
import 'package:mellowde/select_album_edit_ui.dart';
import 'package:mellowde/song_component.dart';
import 'package:mellowde/song_creation_namebio_ui.dart';
import 'package:mellowde/song_edit_ui_songs.dart';
import 'package:mellowde/settings_ui.dart';
import 'package:mellowde/welcome.dart';

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
          actions: [
            PopupMenuButton<String>(
              onSelected: (selectChoice) {
                if (selectChoice == 'albumedit') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectAlbumEditUI()),
                  );
                } else if (selectChoice == 'albumcreate') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlbumCreateScreen()),
                  );
                } else if (selectChoice == 'createsong') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SongCreation()),
                  );
                } else if (selectChoice == 'editasong') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SongEditUiSongs()),
                  );
                } else if (selectChoice == 'settings') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()),
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'albumedit',
                    child: Text('Edit an album'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'albumcreate',
                    child: Text('Create an album'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'createsong',
                    child: Text('Upload a song'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'editasong',
                    child: Text('Edit a song'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'settings',
                    child: Text('Settings'),
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
                    ...songs.map((e) => SongComponent(
                          song: e,
                          type: "play",
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
