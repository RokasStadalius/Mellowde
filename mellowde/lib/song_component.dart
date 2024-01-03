import 'package:flutter/material.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/song_creation_namebio_ui.dart';
import 'package:mellowde/song_playing_ui.dart';

class SongComponent extends StatefulWidget {
  final Song song;
  final String type;
  const SongComponent({Key? key, required this.song, required this.type})
      : super(key: key);

  @override
  _SongComponentState createState() => _SongComponentState();
}

class _SongComponentState extends State<SongComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: InkWell(
        onTap: () {
          if (widget.type == "play") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SongPlaying(song: widget.song)),
            );
          } else if (widget.type == "edit") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SongCreation()));
          }
        },
        splashColor: Colors.grey,
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.type == "play") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SongPlaying(song: widget.song)),
                      );
                    } else if (widget.type == "edit") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SongCreation()));
                    }
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(widget.song.imagePath),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.song.songName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Karla",
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.song.artistName,
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
                      onPressed: () {
                        // Define what happens when the delete button is pressed
                        // For example: deleteSong(widget.song);
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
