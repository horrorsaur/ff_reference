import 'package:flutter/material.dart';
import 'package:ff_reference/constants.dart';
import 'package:ff_reference/utils/screen_aware.dart';
import 'package:ff_reference/components/ff_card.dart';

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

  String characterName;
  String characterPicture;

  String origin;

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
    //
    characterName = widget.ffCharacterData[0]['name'];
    characterPicture = widget.ffCharacterData[10]['picture'];
  }

  String getCharacterInformation(int character) {
    // We need to call this to determine what game we clicked on.
    setOriginData();

    // Once we know what origin we are targeting, we need to filter out API data by origin
    String name = widget.ffCharacterData[character]['name'];
    print(name);
    return name;
  }

  String getCharacterPicture(int character) {
    setOriginData();
    characterName = widget.ffCharacterData[character]['picture'];
    return characterName;
  }

  String setOriginData() {
    switch (widget.currentGame) {
      case 0:
        origin = "Final Fantasy 01";
        break;
      case 1:
        origin = "Final Fantasy 02";
        break;
      case 2:
        origin = "Final Fantasy 03";
        break;
      case 3:
        origin = "Final Fantasy 04";
        break;
      case 4:
        origin = "Final Fantasy 05";
        break;
      case 5:
        origin = "Final Fantasy 06";
        break;
      case 6:
        origin = "Final Fantasy 07";
        break;
      case 7:
        origin = "Final Fantasy 08";
        break;
      case 8:
        origin = "Final Fantasy 09";
        break;
      case 9:
        origin = "Final Fantasy 10";
        break;
      case 11:
        origin = "Final Fantasy 12";
        break;
      case 12:
        origin = "Final Fantasy 13";
        break;
      case 0:
        origin = "Final Fantasy 1";
        break;
      case 14:
        origin = "Final Fantasy 15";
        break;
    }
    print(origin);
    return origin;
  }

  Widget renderCharacterCards() {
    return Container(
      width: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              FFCard(
                child: Image.network(
                  getCharacterPicture(0),
                  fit: BoxFit.cover,
                ),
                color: Color(0x50FFFFFF),
                onPress: () {
                  getCharacterInformation(0);
                },
              ),
              FFCard(
                child: Image.network(
                  getCharacterPicture(1),
                  fit: BoxFit.cover,
                ),
                color: Color(0x50FFFFFF),
                onPress: () {
                  getCharacterInformation(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '',
          style: kTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: screenAwareSize(20, context),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: screenAwareSize(10, context)),
            Container(
              child: Image.network(
                gamePictureURL,
              ),
            ),
            SizedBox(height: screenAwareSize(10, context)),
            Container(
              child: Text(
                'Platform: $platform',
                style: kPlatformText,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                'Released on: $releaseDate',
                style: kReleaseDateText,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenAwareSize(20, context)),
            Container(
              child: Text(
                'Description',
                style: kHeaderText,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.white),
            Container(
              child: Text(
                description,
                style: kDescriptionTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenAwareSize(20, context)),
            Container(
              child: Text(
                'Characters',
                style: kHeaderText,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.white),
            renderCharacterCards(),
          ],
        ),
      ),
    );
  }
}
