import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:spotifytiktokv2/networking/spotify_auth.dart';

class PlayListTracks {
  SpotifyAuth _auth = SpotifyAuth();
  final String playlistId;

  PlayListTracks({this.playlistId});

  Future getplayListTracks(String playlistId) async {
    String accessToken = await _auth.doAuth();
    print('Main track auth pe hoon');
    print(accessToken);

    final response = await http.get(
        Uri(
          scheme: 'https',
          host: 'api.spotify.com',
          path: 'v1/playlists/$playlistId/tracks',
          queryParameters: {
            "market": "US",
            "limit": "100",
          },
        ),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + accessToken.toString(),
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
          HttpHeaders.acceptHeader: "application/json"
        });

    if (response.statusCode != 200) {
      print('${response.reasonPhrase}');
      print('${response.statusCode}');
      throw Exception();
    } else {
      final playlistItems = jsonDecode(response.body);
      var formattedData = [];
      for (var i = 0; i < playlistItems['items'].length; i++) {
        if (playlistItems['items'][i]['track']['name'] == null ||
            playlistItems['items'][i]['track']['album']['images'] == null ||
            playlistItems['items'][i]['track']['preview_url'] == null) {
          continue;
        } else {
          formattedData.add(
            {
              "name": playlistItems['items'][i]['track']['name'],
              "trackimage": playlistItems['items'][i]['track']['album']
                  ['images'][0]['url'],
              "previewurl": playlistItems['items'][i]['track']['preview_url'],
            },
          );
         
        }
      }
       return playlistItems;
    }
  }
}
