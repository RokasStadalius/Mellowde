class Playlist {
  int idPlaylist;
  String name;
  String description;
  String coverURL;
  int userId;

  Playlist(this.idPlaylist, this.name, this.description, this.coverURL, this.userId);

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      json['idPlaylist'],
      json['name'],
      json['description'],
      json['coverURL'],
      json['userId'],
    );
  }

  int get playlistId => idPlaylist; // Arba tiesiog pakeiskite get playlistId => idPlaylist;
}
