import 'dart:math';

import 'package:tic_tact_toe/core/constants.dart';

class GameController {
  String currentTurn = "";
  bool menuInitialActive = true;
  bool endGame = false;
  String winner = "";
  List<String> board = _initialBoard();

  final players = [Figures.player1, Figures.player2];

  startGame() {
    if (!menuInitialActive) {
      board = _initialBoard();
    } else {
      menuInitialActive = false;
    }
    winner = "";
    endGame = false;
    currentTurn = _getRandomTurn();
  }

  static _initialBoard() {
    return ["", "", "", "", "", "", "", "", ""];
  }

  _getRandomTurn() {
    return Random().nextInt(2) == 0 ? Figures.player1 : Figures.player2;
  }

  onTap(int index) {
    if (board[index].isEmpty) {
      board[index] = currentTurn;
      _checkWinnerOrTie();
      if (!endGame) {
        _nextTurn();
      }
    }
  }

  _checkWinnerOrTie() {
    for (String player in players) {
      //Horinzontais
      if ((board[0] == player && board[1] == player && board[2] == player) ||
          (board[3] == player && board[4] == player && board[5] == player) ||
          (board[6] == player && board[7] == player && board[8] == player) ||

          //Verticais
          (board[0] == player && board[3] == player && board[6] == player) ||
          (board[1] == player && board[4] == player && board[7] == player) ||
          (board[2] == player && board[5] == player && board[8] == player) ||

          //Diagonais
          (board[0] == player && board[4] == player && board[8] == player) ||
          (board[2] == player && board[4] == player && board[6] == player)) {
        endGame = true;
        winner = "$player venceu!";
        return;
      }
    }

    //check tied
    for (String tile in board) {
      if (tile.isEmpty) {
        return;
      }
    }

    winner = "Empate";
    endGame = true;
  }

  _nextTurn() {
    currentTurn =
        currentTurn == Figures.player1 ? Figures.player2 : Figures.player1;
  }
}
