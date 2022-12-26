import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tact_toe/presentation/controller/game_controller.dart';
import 'package:tic_tact_toe/presentation/modal/end_game_modal.dart';
import 'package:tic_tact_toe/presentation/modal/menu_modal.dart';
import 'package:tic_tact_toe/presentation/widgets/board_tile.dart';

class GameView extends StatefulWidget {
  final GameController controller = GameController();
  GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "press start2p regular",
                    ),
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(minWidth: 300, maxWidth: 300.0),
                  height: 400,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            childAspectRatio: 1,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 2),
                    itemBuilder: (context, index) => BoardTile(
                      content: widget.controller.board[index],
                      onTap: () {
                        setState(() {
                          widget.controller.onTap(index);
                        });
                      },
                    ),
                  ),
                ),
                if (widget.controller.currentTurn.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "É a vez do  ${widget.controller.currentTurn}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "press start2p regular",
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (widget.controller.menuInitialActive)
            MenuModal(
              onStart: () {
                setState(() {
                  widget.controller.startGame();
                });
              },
            ),
          if (widget.controller.endGame && !widget.controller.menuInitialActive)
            EndGameModal(
              winner: widget.controller.winner,
              onRetry: () {
                setState(() {
                  widget.controller.startGame();
                });
              },
            ),
        ],
      )),
    );
  }
}
