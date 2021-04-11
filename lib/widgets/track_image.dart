import 'package:flutter/material.dart';

class TrackImage extends StatelessWidget {
  final String imageUrl;
  final String trackName;

  const TrackImage({Key key, this.imageUrl, this.trackName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
      
  
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.69), BlendMode.dstATop),
          image: NetworkImage(
            imageUrl.toString(),
          ),
        ),
      ),
    ),
    Positioned(
      left: -5,
      top: 75,
      child: Padding(
        padding: const EdgeInsets.only(left:5.0),
        child: Container(
              width: 220.0,
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
                color: Colors.black87
              ),
              child: Center(
                child: Text(
                  trackName,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    color: Colors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
      ),
    ),
      ],
    );
  }
}
