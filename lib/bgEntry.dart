import 'package:audio_service/audio_service.dart';

import 'audioPlayer.dart';

backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}