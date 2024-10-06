import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool isError = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://sscsott.com/FHD/GCTV/index.m3u8'),
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          _isPlaying = true;
          isError = false;
        });
      }).catchError((error) {
        setState(() {
          isError = true;
          _isPlaying = false;
        });
      });
  }

  void togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void toggleFullScreen() {
    setState(() {
      if (_isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight]);
      }
      _isFullScreen = !_isFullScreen;
    });
  }

  String _formatDuration(Duration position) {
    final minutes = position.inMinutes.toString().padLeft(2, "0");
    final seconds = (position.inSeconds % 60).toString().padLeft(2, "0");
    return "$minutes : $seconds";
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: isError
            ? _buildErrorWidget() // Show error UI
            : _controller.value.isInitialized
                ? _buildVideoPlayer() // Show video player
                : const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Source error',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _initializeVideo,
          child: const Text('RETRY'),
        ),
      ],
    );
  }

  Widget _buildVideoPlayer() {
    return Center(
      child: _isFullScreen
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio, // Fullscreen keeps the aspect ratio
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoPlayer(_controller),
            _buildVideoControls(),
          ],
        ),
      )
          : FittedBox(
        fit: BoxFit.contain, // Ensures the video maintains its aspect ratio without stretching
        child: SizedBox(
          width: _controller.value.size.width, // Actual width of the video
          height: _controller.value.size.height, // Actual height of the video
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller),
              _buildVideoControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoControls() {
    final double iconSize = _isFullScreen ? 30 : 80; // Larger icons in non-fullscreen mode
    final double padding = _isFullScreen ? 8 : 16;   // Larger padding in non-fullscreen mode
    final double progressHeight = _isFullScreen ? 10 : 18;

    return Container(
      color: Colors.black45, // Semi-transparent background for controls
      padding: EdgeInsets.all(padding), // Dynamic padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Play/Pause button
          IconButton(
            onPressed: togglePlayPause,
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: iconSize, // Dynamic icon size
            ),
          ),
          // Current position of the video
          Text(
            _formatDuration(_controller.value.position),
            style: TextStyle(color: Colors.white, fontSize: _isFullScreen ? 16 : 45), // Dynamic font size
          ),
          const SizedBox(width: 26,),
          // Progress indicator
          Expanded(
            child: SizedBox(
              height: progressHeight,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.white,
                  bufferedColor: Colors.white54,
                ),
              ),
            ),
          ),
          const SizedBox(width: 26,),
          // Total duration of the video
          Text(
            _formatDuration(_controller.value.duration),
            style: TextStyle(color: Colors.white, fontSize: _isFullScreen ? 16 : 45), // Dynamic font size
          ),
          // Fullscreen toggle button
          IconButton(
            onPressed: toggleFullScreen,
            icon: Icon(
              _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
              color: Colors.white,
              size: iconSize, // Dynamic icon size
            ),
          ),
        ],
      ),
    );
  }
}