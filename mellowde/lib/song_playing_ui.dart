import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mellowde/controls.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/position_data.dart';
import 'package:rxdart/rxdart.dart';

class SongPlaying extends StatefulWidget {
  final Song song;
  const SongPlaying({Key? key, required this.song}) : super(key: key);

  @override
  State<SongPlaying> createState() => _SongPlayingState();
}

class _SongPlayingState extends State<SongPlaying> {
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setUrl(widget.song.songPath);

    _audioPlayer.positionStream;
    _audioPlayer.bufferedPositionStream;
    _audioPlayer.durationStream;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 130,
      ),
      body: StreamBuilder<PositionData>(
        stream: _positionDataStream,
        builder: (context, snapshot) {
          final positionData = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width, // Full screen width
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/song_playing_bg.png'),
                fit: BoxFit.cover, // Ensure the image covers the entire space
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Set the shape to circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      // Use ClipOval to make the child (image) circular
                      child: Image.network(
                        widget.song.imagePath,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.song.songName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: "Karla",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.song.artistName,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: "Karla",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: ProgressBar(
                    barHeight: 4,
                    baseBarColor: Colors.black,
                    thumbRadius: 5,
                    thumbColor: Colors.purple,
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    onSeek: _audioPlayer.seek,
                    thumbGlowRadius: 10,
                    progressBarColor: Colors.purple,
                    bufferedBarColor: Colors.purple.withOpacity(0.24),
                    barCapShape: BarCapShape.square,
                  ),
                ),
                const SizedBox(height: 20),
                Controls(audioPlayer: _audioPlayer),
              ],
            ),
          );
        },
      ),
    );
  }
}
