import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mellowde/controls.dart';
import 'package:mellowde/models/song.dart';
import 'package:mellowde/position_data.dart';
import 'package:rxdart/rxdart.dart';

class SongPlaying extends StatefulWidget {
  final List<Song> songs;
  final int initialIndex;

  const SongPlaying({Key? key, required this.songs, this.initialIndex = 0})
      : super(key: key);

  @override
  State<SongPlaying> createState() => _SongPlayingState();
}

class _SongPlayingState extends State<SongPlaying> {
  late AudioPlayer _audioPlayer;
  late int _currentIndex;

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
    _audioPlayer = AudioPlayer()
      ..setUrl(widget.songs[widget.initialIndex].songPath);
    _currentIndex = widget.initialIndex;

    _audioPlayer.positionStream.listen((position) {
      // Check if the song has finished and move to the next one
      if (position == _audioPlayer.duration) {
        _playNext();
      }
    });
  }

  void _playNext() {
    if (_currentIndex < widget.songs.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // If at the end of the queue, loop back to the beginning
      setState(() {
        _currentIndex = 0;
      });
    }

    _audioPlayer.stop();
    _audioPlayer.setUrl(widget.songs[_currentIndex].songPath);
    _audioPlayer.play();
  }

  void _playPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _audioPlayer.stop();
      _audioPlayer.setUrl(widget.songs[_currentIndex].songPath);
      _audioPlayer.play();
    }
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
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/song_playing_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        widget.songs[_currentIndex].imagePath,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.songs[_currentIndex].songName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: "Karla",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.songs[_currentIndex].artistName,
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
                Controls(
                  audioPlayer: _audioPlayer,
                  currentIndex: _currentIndex,
                  onNext: _playNext,
                  onPrevious: _playPrevious,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
