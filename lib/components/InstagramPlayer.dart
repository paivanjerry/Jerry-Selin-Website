import 'dart:convert';

/// Video player for Instagram

import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class InstagramPlayer extends StatefulWidget {
  @override
  _InstagramPlayerState createState() => _InstagramPlayerState();

  // Instagram data url is website url + /?__a=1
  // Send GET request and look for video_url key
  final String pageUrl;

  // Loopmode autoplays video with loop. Shows only volume control labels and video progress bar
  final bool loopMode;

  InstagramPlayer({@required this.pageUrl, this.loopMode = true}) : super();
}

class _InstagramPlayerState extends State<InstagramPlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network("")
      ..addListener(() => setState(() {
            videoPosition = _controller.value.position;
          }))
      ..initialize().then((_) => setState(() {
            videoLength = _controller.value.duration;
            _controller.setLooping(!_controller.value.isLooping);
          }));
    fetchVideo();
  }

  Duration videoLength;
  Duration videoPosition;
  double volume = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, bottom: 10, left: 5, right: 5),
              child: InkWell(
                  onTap: () {
                    html.window
                        .open(widget.pageUrl, "Jerry Selin Instagram Video");
                  },
                  child: Text(
                    widget.pageUrl
                        .replaceAll("https://www.", "")
                        .replaceAll("https://", ""),
                    style:
                        TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
                  )),
            ),
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
              if (widget.loopMode)
                Row(
                  children: [
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
                  ],
                ),
              if (!widget.loopMode)
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.lightBlue,
                      ),
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
                            _controller
                                .setLooping(!_controller.value.isLooping);
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

  Future<void> fetchVideo() async {
    if (widget.pageUrl == null) {
      print("No page url provided to IG video");
      return;
    }
    http.Response res = await http.get(widget.pageUrl + "?__a=1");
    if (res.statusCode != 200) {
      return;
    }
    String resBody = res.body;
    final jsonBody = jsonDecode(resBody);
    var shortMedia = jsonBody["graphql"]["shortcode_media"];
    String vid = "";
    if (shortMedia.containsKey("video_url")) {
      vid = shortMedia["video_url"];
    } else {
      // Many videos/images in post, try to get first video, fails if it's img...
      vid = shortMedia["edge_sidecar_to_children"]["edges"][0]["node"]
          ["video_url"];
    }

    setState(() {
      _controller = VideoPlayerController.network(vid)
        ..addListener(() => setState(() {
              videoPosition = _controller.value.position;
            }))
        ..initialize().then((_) => setState(() {
              videoLength = _controller.value.duration;
              _controller.setLooping(
                  widget.loopMode ? true : !_controller.value.isLooping);
              volume = widget.loopMode ? 0 : 0.5;
              _controller.setVolume(volume);
              if (widget.loopMode) {
                _controller.play();
              }
            }));
    });
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
