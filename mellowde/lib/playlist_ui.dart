import 'package:flutter/material.dart';

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  List<String> playlist = [
    'Song 1',
    'Song 2',
    'Song 3',
    'Song 4',
    'Song 5',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(playlist[index]),
          onTap: () {
            // Add custom action when a song is tapped
            print('Song ${index + 1} tapped');
          },
        );
      },
    );
  }
}