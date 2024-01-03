import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mellowde/models/playlist.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/playlist_create_ui.dart';

class AddPlaylist extends StatefulWidget {
  final Song? song;

  const AddPlaylist({Key? key, this.song}) : super(key: key);

  @override
  State<AddPlaylist> createState() => _AddPlaylistState();
}

class _AddPlaylistState extends State<AddPlaylist> {
  List<Playlist> _playlists = [];

  @override
  void initState() {
    super.initState();
    fetchPlaylists();
  }

  void fetchPlaylists() async {
  try {
    final response =
        await http.get(Uri.parse('http://10.0.2.2/fetchplaylistsall.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      if (data.isNotEmpty) {
        setState(() {
          _playlists.addAll(data.map(
              (playlistData) => Playlist.fromJson(playlistData)).toList());
        });
      } else {
        print("Gauti playlistai yra tušti.");
      }
    } else {
      throw Exception('Nepavyko gauti playlistų iš serverio.');
    }
  } catch (e) {
    print("Klaida gavus playlistus: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
              child: Text(
                widget.song?.songName ?? "",
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlaylistCreation(),
                    ),
                  );
                },
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
                onPressed: () {
                  // Pridėti dainą į pasirinktą playlist'ą
                  addToPlaylist(_playlists[0].playlistId);
                },
                child: Text(
                  _playlists.isNotEmpty ? _playlists[0].name : "Playlist 1",
                  style: TextStyle(fontFamily: "Karla"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x7E5496).withOpacity(1),
                ),
              ),
            ),
          ),
          // Likusius playlistus pridėkite čia
        ],
      ),
    );
  }

  void addToPlaylist(int playlistId) async {
    // Siunčiame POST užklausą į serverį su dainos ir playlisto ID
    String url = 'http://10.0.2.2/add_to_playlist.php';
    Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    Map<String, String> body = {
      'songId': widget.song?.idSong.toString() ?? "",
      'playlistId': playlistId.toString(),
    };

    var response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Daina pridėta į playlist'ą sėkmingai.");
      // Įdėkite navigacijos logiką, jei norite pereiti į kitą ekraną po pridėjimo
    } else {
      print("Klaida: ${response.body}");
    }
  }
}
