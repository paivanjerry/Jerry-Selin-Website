import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jerryselin/audioPlayer.dart';
import 'package:jerryselin/bgEntry.dart';
import 'package:just_audio/just_audio.dart';

class MusicWidget extends StatefulWidget {
  @override
  _MusicWidgetState createState() => _MusicWidgetState();

  MusicWidget() : super();
}

class _MusicWidgetState extends State<MusicWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlaybackState>(
      stream: AudioService.playbackStateStream,
      builder: (context, snapshot) {
        final playing = snapshot.data?.playing ?? false;
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(children: [
            Icon(Icons.music_note),
            Text(
              "Everything over 8-bit is a bit too much",
              style: TextStyle(
                  fontSize: 18),
            ),
            Icon(Icons.music_note),
            if (playing)
              Tooltip(message:"Stop", child: GestureDetector(child: Icon(Icons.pause_circle_filled, size: 60, color: Colors.deepPurple,), onTap: stopAudio))
            else
              Tooltip(message: "Play", child: GestureDetector(child: Icon(Icons.play_circle_filled, size: 60, color: Colors.deepPurple), onTap: startAudio)),
          ],),
        );
      },
    );
  }
  startAudio() =>
      AudioService.start(backgroundTaskEntrypoint: backgroundTaskEntrypoint);

  stopAudio() => AudioService.stop();


}//Widget

/*
void _backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

 */