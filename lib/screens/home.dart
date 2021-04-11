import 'package:flutter/material.dart';
import 'package:spotifytiktokv2/networking/featuredPlaylists.dart';
import 'package:spotifytiktokv2/widgets/playlist_carousel.dart';

var homeData = FeaturedPlaylists();

class PlayListScreen extends StatefulWidget {
  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: homeData.getFeaturedPlaylists(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('${snapshot.error}');
              throw Exception();
            } else if (snapshot.hasData) {
              return PlayListCarousel(carouselData: snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
