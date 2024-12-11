import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miles_education/home/model/dataList.dart';
import 'package:miles_education/theme/appColor.dart';
import 'package:miles_education/utility/constant.dart';
import 'package:miles_education/utility/utility.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  FileElement datum;
  VideoPlayerWidget({required this.datum});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String? videoId = Utility().extractYouTubeVideoId(widget.datum.videoUrl.toString());
    print('url===>${videoId}');

    _controller = YoutubePlayerController(
      initialVideoId: videoId!, // Replace with a valid YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print('Player is ready.');
          },
        ),
        builder: (context, player) {
          return Container(color: AppColor.black,
          child: Center(
            child: player,
          ),);
        },
      ),
    );
  }
}

