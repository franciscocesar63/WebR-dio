import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/views/commons/player_buttons.dart';
import 'package:music_player/views/sobre.dart';
import 'package:music_player/views/youtube.dart';
import 'package:url_launcher/url_launcher.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer;
  String url =
      "https://node-10.zeno.fm/cz3g8p26z98uv?rj-ttl=5&rj-tok=AAABfJSKCZIAKOFZpkaoBeqsFA";

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(url)),
    ]))
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: _appbar(),
      body: _body(_audioPlayer),
    );
  }
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // throw 'Could not launch $url';
    print('deu erro com a url ' + url);
  }
}

_body(audioPlayer) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/logo_sem_fundo.png'),
        Text('Igreja Batista da Fé'),
        PlayerButtons(audioPlayer),
        Divider(),
        Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset('assets/youtube.png', width: 40, height: 40),
                iconSize: 34,
                onPressed: () {
                  String url = 'https://www.youtube.com/c/IBRFESOUSA';
                  _launchURL(url);
                },
              ),
              IconButton(
                icon: Image.asset('assets/facebook.png', width: 40, height: 40),
                iconSize: 34,
                onPressed: () {
                  String url = 'https://www.facebook.com/IBRFESOUSA';
                  _launchURL(url);
                },
              ),
              IconButton(
                icon:
                    Image.asset('assets/instagram.png', width: 40, height: 40),
                iconSize: 34,
                onPressed: () {
                  String url = 'https://www.instagram.com/ibrfesousa/';
                  _launchURL(url);
                },
              ),
              IconButton(
                icon: Image.asset('assets/google-maps.png',
                    width: 40, height: 40),
                iconSize: 34,
                onPressed: () {
                  String url = 'https://goo.gl/maps/JVMh3oEXGTDKhDLg6';
                  _launchURL(url);
                },
              ),
            ],
          ),
        ),
        Divider(),
      ],
    ),
  );
}

_appbar() {
  return AppBar(
    title: const Text('Radio Boas Novas'),
  );
}

_drawer(context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/logo_sem_fundo.png',
            ),
            backgroundColor: Colors.white,
          ),
        ),
        ListTile(
          title: const Text('Rádio'),
          onTap: () {
            // Update the state of the app.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Player()),
            );
          },
        ),
        // ListTile(
        //   title: const Text('Transmissão - Youtube'),
        //   onTap: () {
        //     // Update the state of the app.
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Youtube()),
        //     );
        //   },
        // ),
        ListTile(
          title: const Text('Sobre'),
          onTap: () {
            // Update the state of the app.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sobre()),
            );
          },
        ),
      ],
    ),
  );
}
