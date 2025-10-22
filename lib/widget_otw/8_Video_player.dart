import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  bool _isPlaying = false;
  double _currentSpeed = 1.0;
  double _currentVolume = 0.8;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));

    _initializeVideoPlayerFuture = _controller.initialize();

    _initializeVideoPlayerFuture.then((_) {
      _controller.setVolume(_currentVolume);
    }).catchError((error) {
      print('비디오 초기화 에러: $error');
    });

    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlaying() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _changeSpeed(double speed) {
    setState(() {
      _currentSpeed = speed;
      _controller.setPlaybackSpeed(speed);
    });
  }

  void _changeVolume(double volume) {
    setState(() {
      _currentVolume = volume;
      _controller.setVolume(volume);
    });
  }

  void _seekForward() {
    final current = _controller.value.position.inSeconds;
    final duration = _controller.value.duration.inSeconds;
    final newPosition = (current + 10).clamp(0, duration);
    _controller.seekTo(Duration(seconds: newPosition));
  }

  void _seekBackward() {
    final current = _controller.value.position.inSeconds;
    final newPosition =
        (current - 10).clamp(0, _controller.value.duration.inSeconds);
    _controller.seekTo(Duration(seconds: newPosition));
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("8. VideoPlayer"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '비디오 로드 실패',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('에러: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _initializeVideoPlayerFuture = _controller.initialize();
                      });
                    },
                    child: const Text('다시 시도'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // 비디오 플레이어
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),

                  const SizedBox(height: 20),

                  // progressbar
                  ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, VideoPlayerValue value, child) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(
                                playedColor: Colors.blue,
                                bufferedColor: Colors.grey,
                                backgroundColor: Colors.black12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${_formatDuration(value.position)} / ${_formatDuration(value.duration)}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _seekBackward,
                        icon: const Icon(Icons.replay_10),
                        iconSize: 40,
                        tooltip: '10초 뒤로',
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: _togglePlaying,
                        icon: Icon(_isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled),
                        iconSize: 64,
                        color: Colors.blue,
                        tooltip: _isPlaying ? '일시정지' : '재생',
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: _seekForward,
                        icon: const Icon(Icons.forward_10),
                        iconSize: 40,
                        tooltip: '10초 앞으로',
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Divider(),

                  // 재생 속도
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '재생 속도: ${_currentSpeed}x',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: [0.5, 1.0, 1.5, 2.0].map((speed) {
                            return ElevatedButton(
                              onPressed: () => _changeSpeed(speed),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _currentSpeed == speed
                                    ? Colors.blue
                                    : Colors.grey[300],
                                foregroundColor: _currentSpeed == speed
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              child: Text('${speed}x'),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  // 볼륨
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '볼륨: ${(_currentVolume * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.volume_down),
                            Expanded(
                              child: Slider(
                                value: _currentVolume,
                                min: 0.0,
                                max: 1.0,
                                divisions: 10,
                                label: '${(_currentVolume * 100).toInt()}%',
                                onChanged: _changeVolume,
                              ),
                            ),
                            const Icon(Icons.volume_up),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            // 로딩 중
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('비디오 로딩 중...'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
