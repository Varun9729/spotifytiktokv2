import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class TrackControls extends StatefulWidget {
  final String previewurl;

  const TrackControls({Key key, this.previewurl}) : super(key: key);
  @override
  _TrackControlsState createState() => _TrackControlsState();
}

class _TrackControlsState extends State<TrackControls>
    with TickerProviderStateMixin {
  AudioPlayer _audioplayer;
  AudioPlayerState _audioplayerState;
  AnimationController _iconcontroller;

  @override
  void initState() {
    super.initState();
    _audioplayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _audioplayerState = AudioPlayerState.STOPPED;

    _iconcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _audioplayer.dispose();
    super.dispose();
  }

  Future play() async {
    await _audioplayer.play(widget.previewurl, isLocal: false);
    _audioplayer.setPlaybackRate(playbackRate: 1.0);
    setState(() {
      _iconcontroller.forward();

      _audioplayerState = AudioPlayerState.PLAYING;
    });
  }

  Future pause() async {
    await _audioplayer.pause();
    setState(() {
      _iconcontroller.reverse();

      _audioplayerState = AudioPlayerState.PAUSED;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 120,
      right: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 60,
            onPressed: () {
              if (_audioplayerState == AudioPlayerState.PAUSED ||
                  _audioplayerState == AudioPlayerState.STOPPED) {
                play();
              } else if (_audioplayerState == AudioPlayerState.PLAYING) {
                pause();
              }
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _iconcontroller,
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.play_arrow),
          //   onPressed: play,
          // ),
          IconButton(
            iconSize: 60,
            icon: Icon(Icons.ios_share),
            onPressed: () {
              Share.share('Hi');
            },
          ),
        ],
      ),
    );
  }
}
