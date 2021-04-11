import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spotifytiktokv2/screens/track_player.dart';

class PlayListCarousel extends StatefulWidget {
  final carouselData;

   PlayListCarousel({Key key, this.carouselData}) : super(key: key);

  @override
  _PlayListCarouselState createState() => _PlayListCarouselState();
}

class _PlayListCarouselState extends State<PlayListCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext prevcontext) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Container(
            height: double.maxFinite,

        
            
            key: ValueKey<String>(widget.carouselData.playlists.items[_currentPage].images[0].url.toString()),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.carouselData.playlists.items[_currentPage].images[0].url.toString()),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3.5,
                sigmaY: 3.5,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.65,
          child: PageView.builder(
            itemCount: widget.carouselData.playlists.items.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(
                        arguments:
                            widget.carouselData.playlists.items[index].id.toString(),
                      ),
                      builder: (context) {
                        return TrackPlayer();
                      }),
                );
              },
                child: FractionallySizedBox(
                  widthFactor: 0.85,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.carouselData.playlists.items[index].images[0].url),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

/* // Container(
        //   color: Colors.green,
        // ),
        CarouselSlider.builder(
          
          itemCount: carouselData.playlists.items.length,
          options: CarouselOptions(
              height: 450,
              viewportFraction: 0.85,
              aspectRatio: 16 / 9,
              initialPage: 0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(
                        arguments:
                            carouselData.playlists.items[index].id.toString(),
                      ),
                      builder: (context) {
                        return TrackPlayer();
                      }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.2))
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        carouselData.playlists.items[index].images[0].url),
                  ),
                ),
              ),
            );
            
          },
        ),*/