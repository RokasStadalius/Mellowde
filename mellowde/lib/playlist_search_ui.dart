import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mellowde/album_component.dart';
import 'package:mellowde/main_screen_ui.dart';
import 'package:mellowde/models/playlist.dart';
import 'package:mellowde/playlist_component.dart';
import 'package:mellowde/playlist_ui.dart';
import 'package:mellowde/profile_details_ui.dart';

class PlaylistSearchScreen extends StatefulWidget {
  const PlaylistSearchScreen({super.key});

  @override
  State<PlaylistSearchScreen> createState() => _PlaylistSearchScreenState();
}

class _PlaylistSearchScreenState extends State<PlaylistSearchScreen> {
  List<Playlist> playlists = [];

  @override
  void initState() {
    super.initState();
    fetchPlaylists();
  }

  Future<void> fetchPlaylists() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2/fetchplaylistsall.php'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          playlists = data.map((playlistData) {
            return Playlist(
              int.parse(playlistData['playlistId']),
              playlistData['name'],
              playlistData['description'],
              playlistData['imageUrl'],
              int.parse(playlistData['userId']),
              // Pridėkite kitus reikiamus laukus, jei jie yra
            );
          }).toList();
        });
      } else {
        throw Exception('Failed to load playlists');
      }
    } catch (e) {
      print('Error fetching playlists: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(width: 1),
          IconButton(
            icon: Image.asset("assets/usericon.jpg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileDetailsScreen()),
              );
            },
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            icon: Image.asset("assets/logo.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0x00000000),
        title: Center(
          child: SizedBox(
            height: 38,
            width: 300,
            child: TextField(
              onChanged: (value) => onSearch(value),
              decoration: InputDecoration(
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          child: ListView.builder(
            itemCount: playlists.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistUi(),
                    ),
                  );
                },
                child: PlaylistComponent(
                  playlist: playlists[index],
                  type: "play", // Ar šis reikalingas, priklauso nuo jūsų reikalavimų
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  onSearch(String prompt) {}
}
