import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/Instructions.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'cool_header.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'package:flutter/material.dart';


// class ButtonListPage extends StatefulWidget {
//   @override
//   State<ButtonListPage> createState() => _ButtonListPageState();
// }
//
//
// class _ButtonListPageState extends State<ButtonListPage> {
//   int index = 1;
//   int AnnaZack = 0;

class ZongaGuidePage extends StatefulWidget {
  @override
  State<ZongaGuidePage> createState() => _ZongaGuidePageState();
  }

  class _ZongaGuidePageState extends State<ZongaGuidePage> {
  int AnnaZack = 0;
  @override
  Widget build(BuildContext context) {
    if (AnnaZack == 0) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('Welcome to the zonda guide'),
        // ),
        body: ListView(
          children: [
            CoolHeaderWidget(title: 'ZONDA GUIDE', icon: Icons.add_card_sharp),
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  ' Your child is released to his home and will continue to receive nutrition through Zonda.'
                      'We would like to make it easier for you and equip you with a number of rules that will help you take care of your children.'
                      'A probe is a tube that is inserted into the digestive tract, usually through the nose, to provide full or partial nutrition in cases where the child cannot receive the required amount of food orally.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: Center(
                child: ChecklistWidget(
                    items: [
                      '1) The feeding set must be replaced every 24 hours.',
                      '2) After each use, the system must be washed in sterilized lukewarm water.',
                      '3) The tube must be washed in 5cc of sterilized lukewarm water for kids up to the age of 1 year, or regular drinking water for kids over 1 year.',
                      '4) Once the tube is properly set, secure it in place using a bandage.',
                      '5) The optimal position for using the tube is lying with the head and chest lifted by 30 degrees.'
                          '6) Once the tube is properly set, secure it in place using a bandage.',
                      '7) Once the tube is properly set, secure it in place using a bandage.',
                      '8) Once the tube is properly set, secure it in place using a bandage.',
                    ],
                    onItemsChecked: (checkedItems) {
                      // Do something with the checked items
                      print(checkedItems);
                    }),
              ),
            ),

            SizedBox(
              height: 100,
              child: Center(
                  child: ElevatedButton(onPressed: () {
                    setState(() {
                      AnnaZack = 2;
                    });
                  },
                      child: Text("Video Tutorial"))
              ),
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                AnnaZack = 1;
              });
            },
                child: Text("Return"))
          ],
        ),
      );
    }
    else if (AnnaZack == 2){
      print("And the cat goes meow");
      return MyVideoPlayer(videoId: '8sAyPDLorek',);
    }
    else{
      return ButtonListPage();
    }
  }
}
class ChecklistWidget extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onItemsChecked;

  ChecklistWidget({required this.items, required this.onItemsChecked});

  @override
  _ChecklistWidgetState createState() => _ChecklistWidgetState();
}

class _ChecklistWidgetState extends State<ChecklistWidget> {
  List<bool> _checkedItems = [];

  @override
  void initState() {
    super.initState();
    _checkedItems = List<bool>.filled(widget.items.length, false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkedItems[index] = !_checkedItems[index];
      widget.onItemsChecked(getCheckedItems());
    });
  }

  List<String> getCheckedItems() {
    List<String> checkedItems = [];
    for (int i = 0; i < _checkedItems.length; i++) {
      if (_checkedItems[i]) {
        checkedItems.add(widget.items[i]);
      }
    }
    return checkedItems;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          value: _checkedItems[index],
          title: Text(widget.items[index]),
          onChanged: (bool? value) {
            _toggleCheckbox(index);
          },
        );
      },
    );
  }

}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Center(child: CircularProgressIndicator());
  }
}

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  final controller = VideoPlayerController.network('https://www.youtube.com/watch?v=rpufnXcEHgI');

  @override
  void initState() {
    super.initState();
    controller.initialize().then((_) {
      controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}


//youtubeclass from internt

class MyVideoPlayer extends StatefulWidget {
  final String videoId;

  const MyVideoPlayer({Key? key, required this.videoId}) : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}