import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
  final vidUrl;

  VideoPlayerWidget({this.vidUrl}) : super();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.vidUrl)
      ..addListener(() => setState(() {
            videoPosition = _controller.value.position;
          }))
      ..initialize().then((_) => setState(() {
            videoLength = _controller.value.duration;
            _controller.setLooping(!_controller.value.isLooping);
          }));
  }

  Duration videoLength;
  Duration videoPosition;
  double volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (_controller.value.initialized) ...[
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.lightBlue, ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                  Text(
                    '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    animatedVolumeIcon(volume),
                    color: Colors.lightBlue,
                  ),
                  Slider(
                    value: volume,
                    min: 0,
                    max: 1,
                    onChanged: (_volume) => setState(() {
                      volume = _volume;
                      _controller.setVolume(_volume);
                    }),
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.loop,
                        color: _controller.value.isLooping
                            ? Colors.lightBlue
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.setLooping(!_controller.value.isLooping);
                        });
                      }),
                ],
              )
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes < 10
      ? '0${duration.inMinutes}'
      : duration.inMinutes.toString();

  final seconds = duration.inSeconds % 60;

  final parsedSeconds =
      seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
  return '$parsedMinutes:$parsedSeconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}
