import 'package:flutter/material.dart';
import 'package:mellowde/models/song.dart';

class SongComponent extends StatefulWidget {
  final Song song;
  const SongComponent({Key? key, required this.song}) : super(key: key);

  @override
  _SongComponentState createState() => _SongComponentState();
}

class _SongComponentState extends State<SongComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle on tap for the entire song component
      },
      child: InkWell(
        onTap: () {
          // Handle on tap for the entire song component with inkwell
        },
        splashColor: Colors.grey,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle on tap for the song details section
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(widget.song.imagePath),
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
                          style: TextStyle(color: Colors.black38),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
