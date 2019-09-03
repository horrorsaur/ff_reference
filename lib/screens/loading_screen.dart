import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ff_reference/final_fantasy.dart';
import 'package:ff_reference/constants.dart';
import 'package:ff_reference/screens/game_list_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getFFGames();
  }

  void getFFGames() async {
    var ffGameData = await FinalFantasyData().getFinalFantasyGames();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GameListScreen(ffGameData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SpinKitChasingDots(
              color: Colors.white,
              size: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Fetching data, Kupo!',
                    style: kLoadingTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/HelperMoogle.png',
                  width: 175,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
