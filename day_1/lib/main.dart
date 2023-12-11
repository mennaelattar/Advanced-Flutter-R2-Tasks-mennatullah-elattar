import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();
  List playList = [
    "assets/sounds/file_example_MP3_700KB.mp3",
    "assets/sounds/sample-3s.mp3",
    "assets/sounds/sample-9s.mp3",
    "assets/sounds/sample-12s.mp3",
  ];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: playList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text('Sample ${index + 1}'),
              leading: AudioWidget.assets(
                path: playList[index],
                play: isPlaying,
                child: ElevatedButton(
                  onPressed: () {
                    selectedindex = index;
                    setState(() {
                      selectedindex == index
                          ? (isPlaying ? !isPlaying : isPlaying)
                          : (isPlaying = false);
                    });
                    print("selected>>>>>>>>> ${selectedindex}");
                    print("index>>>>>>>>> ${index}");
                    print(">>>>>>>>>>> ${isPlaying}");
                  },
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
