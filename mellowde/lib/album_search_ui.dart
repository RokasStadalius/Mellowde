import 'package:flutter/material.dart';
import 'package:mellowde/album_component.dart';
import 'package:mellowde/models/album.dart';

class AlbumSearchScreen extends StatefulWidget {
  const AlbumSearchScreen({super.key});

  @override
  State<AlbumSearchScreen> createState() => _AlbumSearchScreenState();
}

class _AlbumSearchScreenState extends State<AlbumSearchScreen> {
  List<Album> albums = [Album("album", "author", "")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            const SizedBox(width: 1),
            IconButton(
              icon: Image.asset("assets/usericon.jpg"),
              onPressed: () {},
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Image.asset("assets/logo.png"),
              onPressed: () {},
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
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (BuildContext context, int index) {
              return AlbumComponent(
                album: albums[index],
                type: "play",
              );
            },
          ),
        ),
      ),
    );
  }

  onSearch(String prompt) {}
}
