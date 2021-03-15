/*AUDIO PLAYER*/
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
// Must be a top-level function

class AudioPlayerTask extends BackgroundAudioTask {
  final _audioPlayer = AudioPlayer();
  // final _completer = Completer();

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    // Connect to the URL
    await _audioPlayer.setUrl("https://lifeof.jerrysel.in/music.mp3");
    await _audioPlayer.setLoopMode(LoopMode.one);
    // Now we're ready to play
    _audioPlayer.play();
    AudioServiceBackground.setState(
        controls: [MediaControl.pause, MediaControl.stop],
        playing: true,
        processingState: AudioProcessingState.ready);

  }

  @override
  Future<void> onStop() async {
    // Stop playing audio
    await _audioPlayer.stop();
    await AudioServiceBackground.setState(
        controls: [],
        playing: false,
        processingState: AudioProcessingState.stopped);
    // Shut down this background task
    await super.onStop();
  }
  bool isPlaying(){
    return _audioPlayer.playing;
  }
  Future<void> toggle() async {
    _audioPlayer.playing ? onStop() : onStart({});
  }
  Future<void> playOuch() async {
    _audioPlayer.setAsset("assets/audio/hit.mp3");
  }
}