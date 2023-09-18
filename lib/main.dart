import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final List<String> videoUrls = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
  ];

  late PageController _pageController;
  late ChewieController _chewieController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
    _initializeChewieController();
  }

  void _initializeChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.asset(videoUrls[currentPage]),
      autoPlay: true,
      looping: true,
      // You can customize other ChewieController properties here
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        controller: _pageController,
        onPageChanged: (int index) {
          _chewieController.dispose(); // Dispose of the previous controller
          setState(() {
            currentPage = index;
            _initializeChewieController(); // Initialize a new controller for the new page
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: Chewie(controller: _chewieController),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
