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

  @override
  void initState() {
    super.initState();
    updateUI(widget.ffGameData);
  }

  void updateUI(dynamic ffGameData) {
    if (ffGameData == null) {
      gameTitle = '';
      return;
    }
  }

  dynamic getFFCharacterData(int currentGame) async {
    var ffCharacterData = await FinalFantasyData().getFinalFantasyCharacters();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GameScreen(widget.ffGameData, ffCharacterData, currentGame);
    }));
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            "FF Library",
            style: kInfoTitleStyling,
          ),
          content: Text(
            kInfoButton,
            style: kInfoTextStyling,
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text(
                "Close",
                style: kInfoCloseTextStyling,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget renderGameCards({int selectedGame, String imageName}) {
    return Row(
      children: <Widget>[
        FFCard(
          color: Colors.white,
          onPress: () {
            getFFCharacterData(selectedGame);
          },
          child: Container(
            height: 250,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    getGameTitle(selectedGame),
                    style: kCardTitleTextStyle,
                  ),
                ),
                Image.asset(
                  'assets/images/ff_logos/$imageName.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'FF Library',
          style: kTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            if (widget.ffGameData == null) {
              returnToLoadingScreen();
            } else {
              _showDialog();
//              print(kInfoButton);
            }
          },
          icon: showBackButton(),
        ),
      ),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            renderGameCards(selectedGame: 0, imageName: "FF_1"),
            renderGameCards(selectedGame: 1, imageName: "FF_2"),
            renderGameCards(selectedGame: 2, imageName: "FF_3"),
            renderGameCards(selectedGame: 3, imageName: "FF_4"),
            renderGameCards(selectedGame: 4, imageName: "FF_5"),
            renderGameCards(selectedGame: 5, imageName: "FF_6"),
            renderGameCards(selectedGame: 6, imageName: "FF_7"),
            renderGameCards(selectedGame: 7, imageName: "FF_8"),
            renderGameCards(selectedGame: 8, imageName: "FF_9"),
            renderGameCards(selectedGame: 9, imageName: "FF_10"),
            renderGameCards(selectedGame: 11, imageName: "FF_12"),
            renderGameCards(selectedGame: 12, imageName: "FF_13"),
            renderGameCards(selectedGame: 0, imageName: "FF_14"),
            renderGameCards(selectedGame: 14, imageName: "FF_15"),
          ],
        ),
      ),
    );
  }
}
