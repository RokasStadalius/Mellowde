// import 'package:mellowde/models/song.dart';

// enum ShuffleCriteria { RATING, ARTIST, RANDOM }

// class ShuffleAlgorithm {
//   static List<Song> shuffleSongs(List<Song> songs, List<double> ratings, ShuffleCriteria criteria) {
//     switch (criteria) {
//       case ShuffleCriteria.RATING:
//         return shuffleByRating(songs, ratings);
//       case ShuffleCriteria.ARTIST:
//         return shuffleByArtist(songs);
//       case ShuffleCriteria.RANDOM:
//         return shuffleRandomly(songs);
//       default:
//         return songs;
//     }
//   }

//   static List<Song> shuffleByRating(List<Song> songs, List<double> ratings) {
//     // Create a list of songs with corresponding ratings
//     List<SongWithRating> songsWithRatings = [];
//     for (int i = 0; i < songs.length; i++) {
//       songsWithRatings.add(SongWithRating(song: songs[i], rating: ratings[i]));
//     }

//     // Sort songs by rating in descending order
//     songsWithRatings.sort((a, b) => b.rating.compareTo(a.rating));

//     // Extract the original songs from the sorted list
//     List<Song> shuffledSongs = songsWithRatings.map((songWithRating) => songWithRating.song).toList();

//     return shuffledSongs;
//   }

//   static List<Song> shuffleByArtist(List<Song> songs) {
//     // Shuffle songs while making sure consecutive songs have different artists
//     List<Song> shuffledList = [];
//     List<String> shuffledArtists = [];

//     songs.shuffle();

//     for (Song song in songs) {
//       if (!shuffledArtists.contains(song.artistName)) {
//         shuffledList.add(song);
//         shuffledArtists.add(song.artistName);
//       }
//     }

//     // If not all songs are added (due to repetition of artists), add the remaining songs
//     shuffledList.addAll(songs.where((song) => !shuffledArtists.contains(song.artistName)));

//     return shuffledList;
//   }

//   static List<Song> shuffleRandomly(List<Song> songs) {
//     // Shuffle songs randomly
//     songs.shuffle();
//     return songs;
//   }
// }

// class SongWithRating {
//   final Song song;
//   final double rating;

//   SongWithRating({
//     required this.song,
//     required this.rating,
//   });
// }
