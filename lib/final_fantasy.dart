import 'package:ff_reference/utils/network_helper.dart';

// This class handles retrieving all the data that will be passed from the MoogleAPI to our application.
// We will build various functions and variables that will pertain to the specific API endpoints for
// MoogleAPI.

//https://www.moogleapi.com/api/v1/characters
//https://www.moogleapi.com/api/v1/monsters
//https://www.moogleapi.com/api/v1/games
//https://www.moogleapi.com/api/v1/characters/random

const moogleGameListURL = 'https://www.moogleapi.com/api/v1/games';
const moogleCharacterListURL = 'https://www.moogleapi.com/api/v1/characters';

class FinalFantasyData {
  NetworkHelper nGameHelper = NetworkHelper(moogleGameListURL);
  NetworkHelper nCharacterHelper = NetworkHelper(moogleCharacterListURL);

  Future<dynamic> getFinalFantasyGames() async {
    var gameData = nGameHelper.getData();
    return gameData;
  }

  Future<dynamic> getFinalFantasyCharacters() async {
    var characterData = nCharacterHelper.getData();
    return characterData;
  }
}
