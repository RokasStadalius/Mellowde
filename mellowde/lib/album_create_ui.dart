import 'package:flutter/material.dart';
import 'package:mellowde/album_create_songs_add_ui.dart';
import 'package:mellowde/image_container.dart';

class AlbumCreateScreen extends StatefulWidget {
  const AlbumCreateScreen({super.key});

  @override
  State<AlbumCreateScreen> createState() => _AlbumCreateScreenState();
}

class _AlbumCreateScreenState extends State<AlbumCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/creationBG.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Container(
                width: 300,
                height: 65,
                padding: const EdgeInsets.only(left: 25, right: 20, top: 15),
                margin: const EdgeInsets.symmetric(horizontal: 70),
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
              Container(
                padding: const EdgeInsets.only(left: 25, right: 20, top: 10),
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0x007e5496).withOpacity(1),
                  ),
                  child: const Text(
                    'Select Cover',
                    style: TextStyle(fontFamily: "Karla"),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, top: 220, bottom: 100),
                child: ImageContainer(
                  height: 200,
                  width: 200,
                  imagePath: "",
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 55, right: 45, top: 50),
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AlbumCreateSongAddScreen()),
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
            ],
          ),
        ),
      ),
    );
  }
}
