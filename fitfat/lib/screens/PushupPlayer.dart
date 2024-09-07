import 'package:chewie/chewie.dart';
import 'package:fitfat/screens/Pushups.dart';
import 'package:fitfat/screens/yoga.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Pushupvideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isloop;
  bool isFinished = false;
  Pushupvideo({required this.isloop, required this.videoPlayerController});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<Pushupvideo> {
  late ChewieController chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
        //looping: widget.isloop,
        aspectRatio: 16 / 9,
        allowMuting: true,
        autoPlay: true,
        //fullScreenByDefault: true,
        autoInitialize: true,
        videoPlayerController: widget.videoPlayerController);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    chewieController.dispose();
    chewieController.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}

class PushVideoDisplay extends StatefulWidget {
  PushVideoDisplay();

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<PushVideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: BackButton(
            onPressed: () {
              dispose();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PushUps()));
            },
            color: Colors.white, // <-- SEE HERE
          ),
          centerTitle: true,
        ),
        body: Pushupvideo(
          isloop: false,
          videoPlayerController: VideoPlayerController.network(
              'https://firebasestorage.googleapis.com/v0/b/fitfat-36f6f.appspot.com/o/WorkoutVideos%2FThe%20Perfect%20Push%20Up%20_%20Do%20it%20right!.mp4?alt=media&token=a7c08050-ea82-401c-9615-f1b6ca9b5327'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
