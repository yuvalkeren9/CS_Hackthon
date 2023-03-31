import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/Instructions.dart';
import 'package:namer_app/daily_schedule.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'anotherOne.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Profile.dart';


int globalNoNoBool = 0;
Widget globalWidgetPage = Text("I am global!");

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  //yuval's garbage
  var micropobe = 10;
  void increaseMicropobe(){
    ++micropobe;
    notifyListeners();
  }
  void decreaseMicropobe(){
    --micropobe;
    notifyListeners();
  }
  int syringe = 30;
  void increaseSyringe(){
    ++syringe;
    notifyListeners();
  }
  void decreaseSyringe(){
    --syringe;
    notifyListeners();
  }

  int feedingBagAmount = 50;
  void increaseFeedingBag(){
    ++feedingBagAmount;
    notifyListeners();
  }
  void decreaseFeedingBag(){
    --feedingBagAmount;
    notifyListeners();
  }

  int distilledwater = 10;
  void increasedistilledwater(){
    ++distilledwater;
    notifyListeners();
  }
  void decreasedistilledwater(){
    --distilledwater;
    notifyListeners();
  }

  int disinfectionpad = 45;
  void increasedisinfectionpad(){
    ++disinfectionpad;
    notifyListeners();
  }
  void decreasedisinfectionpad(){
    --disinfectionpad;
    notifyListeners();
  }

}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePageMeow();
        break;
      case 1:
        page = daily_schedule();
        break;
      case 2:
        page = ButtonListPage();
        break;
      case 3:
        page = pageEquipmentList();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
        break;
    }

    return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.calendar_today),
                        label: Text('Daily Schedule'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.school),
                        label: Text('Instructions'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.list_outlined),
                        label: Text('Watchlist'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page,
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
class HomePageMeow extends StatefulWidget{
  @override
  _HomePageMeowState createState() => _HomePageMeowState();
}

class _HomePageMeowState extends State<HomePageMeow> {

  int OmerAdam = 0;

  @override
  Widget build(BuildContext context) {
    if (OmerAdam == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Medicine App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.healing, size: 80.0, color: Colors.blue),
              SizedBox(height: 20.0),
              Text(
                'Back Home - Your Digital Case Manager',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.settings, size: 60.0, color: Colors.blue),
                  Icon(Icons.medication, size: 60.0, color: Colors.blue),
                  Icon(Icons.person_outline, size: 60.0, color: Colors.blue),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {},
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  ElevatedButton(onPressed: () {},
                    child: Text(
                      'My Medications',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    print("Huff");
                    setState(() {
                      OmerAdam = 1;
                    });
                  },
                    child: Text(
                      'My Profile',
                      style: TextStyle(fontSize: 16.0),
                    ),)
                ],
              ),
            ],
          ),
        ),
      );
    }
    else {
      return
          NursePage();
    };
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites swagger yet.'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('Unicorn.'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}


//----------------------Yuvals code sorry -----------------------


class pageEquipmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var kangarooState = context.watch<MyAppState>();
    int micropobe = kangarooState.micropobe;
    int syringe = kangarooState.syringe;
    int feedingBagAmount = kangarooState.feedingBagAmount;
    int distilledwater = kangarooState.distilledwater;
    int disinfectionpad = kangarooState.disinfectionpad;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CoolHeaderWidgetEquip(title: "Expendable Materials Watchlist", icon: Icons.check_box_outline_blank,),
        Row(
            children: [
              Text('$micropobe', style: TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('microfor', style: TextStyle(fontSize: 25)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.decreaseMicropobe();
                  },
                  icon: Icon(Icons.remove),
                  label: Text('less'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.increaseMicropobe();
                  },
                  icon: Icon(Icons.add),
                  label: Text('add'),
                ),
              )
            ]

        ),
        Row(
            children: [
              Text('$syringe', style: TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('10cc syringe', style: TextStyle(fontSize: 25)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.decreaseSyringe();
                  },
                  icon: Icon(Icons.remove),
                  label: Text('less'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.increaseSyringe();
                  },
                  icon: Icon(Icons.add),
                  label: Text('add'),
                ),
              ),
            ]
        ),
        Row(
            children: [
              Text('$feedingBagAmount', style: TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('"kengero" feeding bag', style: TextStyle(fontSize: 25)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.decreaseFeedingBag();
                  },
                  icon: Icon(Icons.remove),
                  label: Text('less'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.increaseFeedingBag();
                  },
                  icon: Icon(Icons.add),
                  label: Text('add'),
                ),
              ),
            ]
        ),
        Row(
            children: [
              Text('$distilledwater', style: TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('disttiled water bag', style: TextStyle(fontSize: 25)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.decreasedistilledwater();
                  },
                  icon: Icon(Icons.remove),
                  label: Text('less'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.increasedistilledwater();
                  },
                  icon: Icon(Icons.add),
                  label: Text('add'),
                ),
              ),
            ]
        ),
        Row(
            children: [
              Text('$disinfectionpad', style: TextStyle(fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('disinfection pads', style: TextStyle(fontSize: 25)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.decreasedisinfectionpad();
                  },
                  icon: Icon(Icons.remove),
                  label: Text('less'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    kangarooState.increasedisinfectionpad();
                  },
                  icon: Icon(Icons.add),
                  label: Text('add'),
                ),
              ),
            ]
        ),
      ],
    );
  }
}

class CoolHeaderWidgetEquip extends StatelessWidget {
  final String title;
  final IconData icon;

  CoolHeaderWidgetEquip({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class ButtonListPage extends StatefulWidget {
  @override
  State<ButtonListPage> createState() => _ButtonListPageState();
}


class _ButtonListPageState extends State<ButtonListPage> {
  int index = 1;
  int AnnaZack = 0;

  @override
  Widget build(BuildContext context) {
    switch (AnnaZack) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text('Button List'),
          ),
          body: Center(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[ Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250.0,
                    height: 160.0,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Huff");
                        setState(() {
                          AnnaZack = 1;
                        });
                      },
                      child: Text('NG setup'),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    width: 250.0,
                    height: 160.0,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Huff");
                        setState(() {
                          AnnaZack = 1;
                        });
                      },
                      child: Text('Bandage change'),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                    width: 250.0,
                    height: 160.0,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Huff");
                        setState(() {
                          AnnaZack = 1;
                        });
                      },
                      child: Text('Vital signs'),
                    ),
                  ),
                ],
              ),
                SizedBox(
                    width:230,
                    height: 150),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250.0,
                      height: 160.0,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Huff");
                          setState(() {
                            AnnaZack = 1;
                          });
                        },
                        child: Text('Replacing "kengaro" bag'),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    SizedBox(
                      width: 250.0,
                      height: 160.0,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Huff");
                          setState(() {
                            AnnaZack = 1;
                          });
                        },
                        child: Text('Cleaning the system after feeding'),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    SizedBox(
                      width: 250.0,
                      height: 160.0,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Huff");
                          setState(() {
                            AnnaZack = 1;
                          });
                        },
                        child: Text('Tobos Replacement'),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        );
      case 1:
        return ZongaGuidePage();
      default:
        print("BAD!!!!!!!");
        return daily_schedule();
    }
  }
}




//YOUTUBE




class YoutubeClass extends StatelessWidget {
  static String myVideoId = 'rpufnXcEHgI';
  // https://www.youtube.com/watch?v=rpufnXcEHgI
  // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA
  // it's an interesting video from NASA on Youtube
  //https://www.youtube.com/watch?v=rpufnXcEHgI

  // Initiate the Youtube player controller
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  YoutubeClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter and Youtube'),
        ),
        body: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ));
  }
}





//Second youtube


/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

