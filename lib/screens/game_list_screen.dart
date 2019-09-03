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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0, left: 24.0),
                    child: Text(
                      'Final Fantasy',
                      style: kTitleTextStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (widget.ffGameData == null) {
                        returnToLoadingScreen();
                      } else {
                        print(kInfoButton);
                      }
                    },
                    icon: showBackButton(),
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: FFCard(
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              getGamePicture(0),
                              height: 100,
                            ),
                          ],
                        ),
                        color: Colors.white,
                        onPress: () {
                          getFFCharacterData(0);
                        },
                      ),
                    ),
                    Expanded(
                      child: FFCard(
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              getGamePicture(1),
                              height: 100,
                            ),
                          ],
                        ),
                        color: Colors.white,
                        onPress: () {
                          getFFCharacterData(1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FFCard(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(2),
                            height: 100,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPress: () {
                        getFFCharacterData(2);
                      },
                    ),
                  ),
                  Expanded(
                    child: FFCard(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(3),
                            height: 100,
                          ),
                        ],
                      ),
                      color: Colors.white,
                      onPress: () {
                        getFFCharacterData(3);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(4);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(4),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(5);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(5),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(6);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(6),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(7);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(7),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(8);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(8),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(9);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(9),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(10);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(10),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(11);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(11),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(12);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(12),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFCard(
                      onPress: () {
                        getFFCharacterData(13);
                      },
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            getGamePicture(13),
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
