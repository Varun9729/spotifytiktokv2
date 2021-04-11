import 'package:flutter/material.dart';
import 'package:spotifytiktokv2/networking/playlist_tracks.dart';
import 'package:spotifytiktokv2/widgets/track_controls.dart';
import 'package:spotifytiktokv2/widgets/track_image.dart';

class TrackPlayer extends StatefulWidget {
  @override
  _TrackPlayerState createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  @override
  Widget build(BuildContext context) {
    var playlistId = ModalRoute.of(context).settings.arguments;
    final tracks = PlayListTracks(playlistId: playlistId);

    return Scaffold(
      body: FutureBuilder(
          future: tracks.getplayListTracks(playlistId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
             
              return PageView.builder(
                  itemCount: snapshot.data['items'].length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        TrackImage(
                          imageUrl: snapshot.data['items'][index]['track']
                              ['album']['images'][0]['url'],
                          trackName: snapshot.data['items'][index]['track']['name'],
                        ),
                        TrackControls(
                          previewurl: snapshot.data['items'][index]['track']
                              ['preview_url'],
                        ),
                      ],
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
