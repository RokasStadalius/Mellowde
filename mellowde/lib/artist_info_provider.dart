import 'package:flutter/material.dart';
import 'package:mellowde/models/artist_info.dart';

class ArtistInfoProvider with ChangeNotifier {
  late ArtistInfo _artistInfo;

  ArtistInfo get artistInfo => _artistInfo;

  void setArtistInfo(ArtistInfo artistInfo) {
    _artistInfo = artistInfo;
    notifyListeners();
  }
}
