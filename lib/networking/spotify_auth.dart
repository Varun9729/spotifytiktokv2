import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class SpotifyAuth {
  final String url;

  SpotifyAuth({this.url = 'https://accounts.spotify.com/api/token'});

  Future<String> doAuth() async {
    var basicAuth = 'Basic ' +
        base64Encode(utf8.encode(
            '357b8297f5404569a2b4ca634b2b227a:cbfa994e06fb4417a9342ce2a94601a1'));
    final response = await http.post(
        Uri(
            scheme: 'https',
            host: 'accounts.spotify.com',
            path: 'api/token',
            queryParameters: {"grant_type": "client_credentials"}),
        headers: {
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
          HttpHeaders.authorizationHeader: basicAuth,
        });
    if (response.statusCode != 200) {
      print('${response.reasonPhrase}');
      throw Exception();
    } else {
      final tokenData = jsonDecode(response.body);
      final accessToken = tokenData['access_token'];
      print('AccessToken is : $accessToken');
      return accessToken;
    }
  }
}
