import 'package:flutter/material.dart';
import 'package:ff_reference/constants.dart';
import 'package:ff_reference/components/ff_card.dart';
import 'package:ff_reference/final_fantasy.dart';
import 'game_screen.dart';

class GameListScreen extends StatefulWidget {
  GameListScreen(this.ffGameData);

  final ffGameData;

  @override
  _GameListScreenState createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  // API Variables
  String gameTitle;
  String gamePictureURL;

  // Game Tracking Variables
  int currentGame = 0; // currentGame = Final Fantasy 01

  @override
  void initState() {
    super.initState();
    updateUI(widget.ffGameData);
  }

  void updateUI(dynamic ffGameData) {
    if (ffGameData == null) {
      gameTitle = '';
      gamePictureURL = '';
      return;
    }
  }

  dynamic getFFCharacterData(int currentGame) async {
    var ffCharacterData = await FinalFantasyData().getFinalFantasyCharacters();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GameScreen(widget.ffGameData, ffCharacterData, currentGame);
    }));
  }

  String getGamePicture(int currentGame) {
    if (widget.ffGameData == null) {
      gamePictureURL = '';
      return gamePictureURL;
    }

    gamePictureURL = widget.ffGameData[currentGame]['picture'];
    return gamePictureURL;
  }

  String getGameTitle(int currentGame) {
    if (widget.ffGameData == null) {
      gameTitle = '';
      return gameTitle;
    }

    gameTitle = widget.ffGameData[currentGame]['title'];
    return gameTitle;
  }

  void returnToLoadingScreen() {
    Navigator.pop(context);
  }

  // This method handles deciding whether the button should be rendered as a back arrow
  // or an information icon.
  Icon showBackButton() {
    if (widget.ffGameData == null) {
      Icon titleIcon = Icon(Icons.arrow_back);
      return titleIcon;
    } else {
      Icon titleIcon = Icon(Icons.info_outline);
      return titleIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Matoya\'s Cave',
          style: kTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            if (widget.ffGameData == null) {
              returnToLoadingScreen();
            } else {
              print(kInfoButton);
            }
          },
          icon: showBackButton(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FFCard(
                    onPress: () {
                      getFFCharacterData(0);
                    },
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Final Fantasy 1',
                            style: kCardTitleTextStyle,
                          ),
                        ),
                        Image.asset(
                          'assets/images/ff_logos/FF_1.png',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FFCard(
                  onPress: () {
                    getFFCharacterData(1);
                  },
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Final Fantasy 2',
                          style: kCardTitleTextStyle,
                        ),
                      ),
                      Image.asset(
                        'assets/images/ff_logos/FF_2.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
