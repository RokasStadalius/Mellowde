import 'package:flutter/material.dart';

class AddPlaylist extends StatefulWidget{
  const AddPlaylist({Key? key}) : super(key: key);

  @override
  State<AddPlaylist> createState() => _AddPlaylistState();
}

class _AddPlaylistState extends State<AddPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
          onPressed: () {},
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 100,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/song_playing_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 80,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "BasketCase - Green Day",
                style: TextStyle(
                  fontFamily: "Karla",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 100,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Create',
                  style: TextStyle(fontFamily: "Karla"),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Color(0x7E5496).withOpacity(1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 60,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 280,
              height: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'My Playlist 1',
                  style: TextStyle(fontFamily: "Karla"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x7E5496).withOpacity(1),
                ),
              ),
            ),
          ),
          Positioned(
            top: 440,
            left: 60,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 280,
              height: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'My Playlist 2',
                  style: TextStyle(fontFamily: "Karla"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x7E5496).withOpacity(1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 160,
            left: 60,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 280,
              height: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'My Playlist 3',
                  style: TextStyle(fontFamily: "Karla"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x7E5496).withOpacity(1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 60,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 280,
              height: 150,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'My Playlist 3',
                  style: TextStyle(fontFamily: "Karla"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x7E5496).withOpacity(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


