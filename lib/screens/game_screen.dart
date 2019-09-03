import 'package:flutter/material.dart';
import 'package:ff_reference/constants.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.ffGameData, this.ffCharacterData, this.currentGame);

  final ffGameData;
  final ffCharacterData;
  final currentGame;

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // API variables to populate our widgets
  String gameTitle;
  String gamePictureURL;
  String releaseDate;
  String platform;
  String description;

  @override
  void initState() {
    super.initState();
    updateUI(widget.ffGameData);
  }

  void updateUI(dynamic ffGameData) {
    if (ffGameData == null) {
      gameTitle = '';
      gamePictureURL = '';
      releaseDate = '';
      platform = '';
      description = '';
      return;
    }

    gameTitle = widget.ffGameData[widget.currentGame]['title'];
    gamePictureURL = widget.ffGameData[widget.currentGame]['picture'];
    releaseDate = widget.ffGameData[widget.currentGame]['releaseDate'];
    platform = widget.ffGameData[widget.currentGame]['platform'];
    description = widget.ffGameData[widget.currentGame]['description'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                iconSize: 34,
              ),
            ),
          ),
          Text(
            gameTitle,
            style: kGameTitleText,
          ),
          Image.network(gamePictureURL),
          Text('Release Date: $releaseDate'),
          Text('Released on $platform'),
          Text(
            description,
            style: kDescriptionTextStyle,
          ),
        ],
      ),
    );
  }
}
