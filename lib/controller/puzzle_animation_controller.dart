import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import '../model/keyboard_key.dart';
import '../model/tile.dart';
import '../overlays/base_overlay.dart';
import '../overlays/game_over_overlay.dart';
import '../overlays/game_won_overlay.dart';
import 'grid_notifiers.dart';

class PuzzleAnimationController {
  int currentPuzzleDimension = 5;
  PuzzleAnimationController(this.currentPuzzleDimension);
  String currentFormedWord = "";
  int currentGridRow = 0;
  String answerWord = "";
  late GridNotifiers gridNotifiers;
  late List<Tile> gridTiles;
  late List<KeyboardKey> keys;
  void init() {
    currentFormedWord = "";
    gridNotifiers =
        GridNotifiers(currentPuzzleDimension * currentPuzzleDimension);
    gridTiles = List.generate(currentPuzzleDimension * currentPuzzleDimension,
        (index) => Tile(index));
    keys = List.generate(26, (index) => KeyboardKey(" "));
    checkAndSetAnswerWord();
  }

  checkAndSetAnswerWord() {
    if (currentPuzzleDimension == 5) {
      answerWord = getRandomFiveLetterAnswerWord();
    } else if (currentPuzzleDimension == 4) {
      answerWord = getRandomFourLetterAnswerWord();
    } else if (currentPuzzleDimension == 6) {
      answerWord = getRandomSixLetterAnswerWord();
    }
    answerWord = answerWord.toUpperCase();
    print("Answer Word: $answerWord");
  }

  getRandomFiveLetterAnswerWord() {
    return gameController.fiveLettersWords[
        Random().nextInt(gameController.fiveLettersWords.length)];
  }

  getRandomFourLetterAnswerWord() {
    return gameController.fourLettersWords[
        Random().nextInt(gameController.fourLettersWords.length)];
  }

  getRandomSixLetterAnswerWord() {
    return gameController.sixLettersWords[
        Random().nextInt(gameController.sixLettersWords.length)];
  }

  void keyPress(String key) {
    if (currentFormedWord.length == currentPuzzleDimension ||
        currentGridRow >= currentPuzzleDimension) {
      return;
    }
    currentFormedWord += key;
    int currentTileIndex =
        currentGridRow * currentPuzzleDimension + currentFormedWord.length - 1;
    gridTiles[currentTileIndex].setText(key);
    gridNotifiers.updateNotifier(currentTileIndex);
  }

  void backSpacekeyPress(String key) {
    if (currentFormedWord.isEmpty) {
      return;
    }
    int currentTileIndex =
        currentGridRow * currentPuzzleDimension + currentFormedWord.length - 1;
    gridTiles[currentTileIndex].setText(" ");
    gridNotifiers.updateNotifier(currentTileIndex);
    currentFormedWord =
        currentFormedWord.substring(0, currentFormedWord.length - 1);
  }

  void submitWord(BuildContext context) {
    if (currentFormedWord.length < currentPuzzleDimension) {
      return;
    }
    checkAndUpdteGridState();
    if (currentFormedWord == answerWord.toUpperCase()) {
      showGameWonOverlay(context);
    } else {
      currentGridRow++;
      if (currentGridRow >= currentPuzzleDimension) {
        baseOverlay.addOverlay(
            Overlays.GameOver, GameOverOverlay(answerWord), context);
        // Game Over show an overlay with the correct answer word
      }
    }
    currentFormedWord = "";
  }

  void checkAndUpdteGridState() {
    int startingGridIndex = currentGridRow * currentPuzzleDimension;
    for (int i = 0; i < currentFormedWord.length; i++) {
      if (currentFormedWord[i] == answerWord[i]) {
        gridTiles[startingGridIndex + i].setColor(Colors.green);
        keys[currentFormedWord[i].codeUnitAt(0) - 65].keyColor = Colors.green;
      } else if (answerWord.contains(currentFormedWord[i])) {
        gridTiles[startingGridIndex + i].setColor(Colors.yellow);
        keys[currentFormedWord[i].codeUnitAt(0) - 65].keyColor = Colors.yellow;
      } else {
        gridTiles[startingGridIndex + i].setColor(Colors.red);
        keys[currentFormedWord[i].codeUnitAt(0) - 65].keyColor = Colors.red;
      }
      gridNotifiers.updateNotifier(startingGridIndex + i);
      gridNotifiers
          .updteKeyboardNotifier(currentFormedWord[i].codeUnitAt(0) - 65);
    }
  }

  void showGameWonOverlay(BuildContext context) {
    baseOverlay.addOverlay(Overlays.GameWon, GameWonOverlay(), context);
  }
}
