import 'package:flutter/material.dart';
import 'package:mellowde/album_edit_ui.dart';
import 'package:mellowde/album_songs_ui.dart';
import 'package:mellowde/models/album.dart';

class AlbumComponent extends StatefulWidget {
  final Album album;
  final String type;
  const AlbumComponent({super.key, required this.album, required this.type});

  @override
  State<AlbumComponent> createState() => _AlbumComponentState();
}

class _AlbumComponentState extends State<AlbumComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: InkWell(
        onTap: () {
          if (widget.type == "edit") {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AlbumEditUi()),
            // );
          } else if (widget.type == "play") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumSongScreen(album: widget.album)),
            );
          }
        },
        splashColor: Colors.grey,
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(widget.album.coverURL),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.album.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Karla",
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.album.artistName,
                            style: const TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Add the delete IconButton
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                          Icons.delete), // Customize the icon as needed
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
