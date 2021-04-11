import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:spotifytiktokv2/models/fetchPlaylists.dart' as pmodel;
import 'package:spotifytiktokv2/networking/spotify_auth.dart';

class FeaturedPlaylists {
  SpotifyAuth _auth = SpotifyAuth();

  Future getFeaturedPlaylists() async {
    String accessToken = await _auth.doAuth();
    print(accessToken);

    final response = await http.get(
        Uri(
          scheme: 'https',
          host: 'api.spotify.com',
          path: 'v1/browse/featured-playlists',
        ),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + accessToken.toString(),
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
          HttpHeaders.acceptHeader: "application/json"
        });

    if (response.statusCode != 200) {
      print('${response.reasonPhrase}');
      throw Exception();
    } else {
      final featuredPlaylistdata = jsonDecode(response.body);
      return pmodel.FPlaylists.fromJson(featuredPlaylistdata);
    }
  }
}
