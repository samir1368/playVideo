import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'collapsing_toolbar.dart';


class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/gif/bee.mp4');
    _controller.setLooping(false);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    Timer(Duration(seconds: 20) ,(){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainCollapsingToolbar()));
 //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainCollapsingToolbar()));
    });
  }
  @override
  Widget build(BuildContext context) {
     final size = _controller.value.size;

    return new ClipRect(


          child:  new OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                alignment: Alignment.center,
          //     child: InkWell(
               //     onTap: () {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainCollapsingToolbar())); },
                    child: new FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,

                      child: Container(
                          width: getWidthSize(size),
                          height:getHeightSize(size),
                          child: new VideoPlayer(_controller)),
                    )

              //  )

          )

    );

  }
 double getWidthSize(Size size){
   if(size.width==0)
     return 100;
   else
     return size.width;
   }
  double getHeightSize(Size size){
    if(size.height==0)
      return 100;
    else
      return size.height;
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}