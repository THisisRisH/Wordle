import 'package:flutter/services.dart';

class GameController {
  List<String> fiveLettersWords = [];
  List<String> fourLettersWords = [];
  List<String> sixLettersWords = [];
  final String fiveLettersWordsPath = "assets/five_letters_words.txt";
  final String fourLettersWordsPath = "assets/four_letters_words.txt";
  final String sixLettersWordsPath = "assets/six_letters_words.txt";
  Future<void> loadWords() async {
    final String words = await rootBundle.loadString(fiveLettersWordsPath);
    fiveLettersWords = words.split(",");
    fiveLettersWords.shuffle();
    final String fourWords = await rootBundle.loadString(fourLettersWordsPath);
    fourLettersWords = fourWords.split(",");
    fourLettersWords.shuffle();
    final String sixWords = await rootBundle.loadString(sixLettersWordsPath);
    sixLettersWords = sixWords.split(",");
    sixLettersWords.shuffle();
  }
}
