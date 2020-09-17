import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ExternalVideoPlayer extends StatefulWidget {
  @override
  _ExternalVideoPlayerState createState() => _ExternalVideoPlayerState();

  final id;

  ExternalVideoPlayer({this.id}) : super();
}

class _ExternalVideoPlayerState extends State<ExternalVideoPlayer> {
  YoutubePlayerController _controller;


  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      params: const YoutubePlayerParams(
        autoPlay: false,
        startAt: const Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
      ),
    )..listen((value) {
      if (value.isReady && !value.hasPlayed) {
        _controller
          ..hidePauseOverlay()
          ..hideTopMenu();
      }
    });
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,

      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: LayoutBuilder(
          builder: (context, constraints) {
              return player;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

