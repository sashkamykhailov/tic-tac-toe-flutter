import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  bool gameFinished = false;

  bool oTurn = true;

  bool winnerFound = false;

  String resultDeclaration = '';

  int oScore = 0;

  int xScore = 0;

  int filledBoxes = 0;

  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];


  void _clearTheBoard() {
    setState(() {
      displayXO = [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ];
      resultDeclaration = '';
      winnerFound = false;
      oTurn = true;
      filledBoxes = 0;
      gameFinished = false;
    });
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        _updateScore(displayXO[0]);
        gameFinished = true;
      });
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        _updateScore(displayXO[0]);
        gameFinished = true;
      });
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins!';
        _updateScore(displayXO[0]);
        gameFinished = true;
      });
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' Wins!';
        _updateScore(displayXO[1]);
        gameFinished = true;
      });
    } else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        _updateScore(displayXO[2]);
        gameFinished = true;
      });
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins!';
        _updateScore(displayXO[2]);
        gameFinished = true;
      });
    } else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' Wins!';
        _updateScore(displayXO[3]);
        gameFinished = true;
      });
    } else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + ' Wins!';
        _updateScore(displayXO[6]);
        gameFinished = true;
      });
    } else if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = 'Nobody wins this time!';
        gameFinished = true;
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    } else {
      return;
    }
    winnerFound = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Player 0 - score: $oScore',
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                color: MainColor.fontColor,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Text(
                            'Player X - score: $xScore',
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                color: MainColor.fontColor,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: winnerFound ?  null : () {
                        _tapped(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 5, color: MainColor.primaryColor),
                          color: MainColor.secondaryColor,
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                color: MainColor.primaryColor,
                                fontSize: 44,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: gameFinished ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultDeclaration,
                      style: GoogleFonts.coiny(
                        textStyle: TextStyle(
                          color: MainColor.fontColor,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Clear and start again',
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      onPressed: () {
                        _clearTheBoard();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.fontColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                  ],
                ) : null
              ),
            ),
          ],
        ),
      ),
    );
  }
}
