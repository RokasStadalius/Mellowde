import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mellowde/add_to_playlsit_ui.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/playlist_edit_ui.dart';
import 'package:mellowde/song_component.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mellowde/shuffle_algorithm.dart';


class PlaylistUi extends StatefulWidget {
  const PlaylistUi({Key? key}) : super(key: key);

  @override
  State<PlaylistUi> createState() => _PlaylistState();
}

class _PlaylistState extends State<PlaylistUi> {
  List<Song> _songs = [];
  bool isIconPressed = true;

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  void fetchSongs() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/insert_playlsit.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _songs.addAll(data.map((songData) => Song.fromJson(songData)).toList());
      });
    } else {
      throw Exception('Nepavyko gauti dainų iš serverio.');
    }
  }

  // Function to handle shuffle button press
  void handleShuffle() {
    setState(() {
      //_songs = ShuffleAlgorithm.autoShuffle(_songs);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000).withOpacity(0),
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
                  fillColor: const Color(0x7E5496).withOpacity(1),
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
                margin: const EdgeInsets.only(top: 180, left: 30, right: 20),
                child: ListView.builder(
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
                )),
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
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
          ),
          Positioned(
            top: 260,
            right: -10,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaylistEdit()),
                  );
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
                icon: const Icon(Icons.shuffle),
                onPressed: () {
                  handleShuffle();
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
                color: const Color(0x571B79).withOpacity(1),
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
                        icon: Icon(isIconPressed
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill),
                      ),
                      const SizedBox(
                          width:
                              27), // Adjust the spacing between icon and text
                      Text(
                        _songs.isNotEmpty ? _songs[0].songName : "Song Name",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 0), // Adjust the spacing between icon and text
                  Text(
                    _songs.isNotEmpty ? _songs[0].artistName : "Artist Name",
                    style: const TextStyle(
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