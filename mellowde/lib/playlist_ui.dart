import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/song_component.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  final List<Song> _songs = [
    Song("Basket Case", "Green Day", "assets/DookieGreenDay.png",
        "assets/audio/BasketCase.mp3"),
  ];
  bool isIconPressed = true;

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
                image: AssetImage('assets/PlaylistBG.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 20,
            child: Container(
              height: 35,
              width: 210,
              child: TextField(
                onChanged: (value) => onSearch(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x7E5496).withOpacity(1),
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
          ),
          Positioned(
            top: 120,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "My playlist1",
                style: TextStyle(
                  fontFamily: "Karla",
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "n songs",
                style: TextStyle(
                  fontFamily: "Karla",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 180, left: 30, right: 20),
              child: ListView.builder(
                itemCount: _songs.length,
                itemBuilder: (context, index) {
                  return SongComponent(song: _songs[index]);
                },
              )
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: Container(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {
                },
              ),
            ),
          ),
          Positioned(
            top: 260,
            right: -10,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  // Add your button functionality here
                },
              ),
            ),
          ),
          Positioned(
            top: 260,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(Icons.shuffle),
                onPressed: () {
                  // Add your button functionality here
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 200,
              height: 100,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0x571B79).withOpacity(1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        color: Colors.white,
                        iconSize: 36,
                        onPressed: () {
                          setState(() {
                            isIconPressed = !isIconPressed;
                          });
                        },
                        icon: Icon(
                          isIconPressed ? Icons.pause_circle_filled : Icons.play_circle_fill),
                      ),
                      SizedBox(width: 27), // Adjust the spacing between icon and text
                      Text(
                        _songs.isNotEmpty ? _songs[0].songName : "Song Name",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0), // Adjust the spacing between icon and text
                  Text(
                    _songs.isNotEmpty ? _songs[0].artistName : "Artist Name",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onSearch(String prompt) {}
}