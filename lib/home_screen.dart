import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tictac/provider.dart';
import 'package:tictac/theme.dart';
import 'cell.dart';

class Myscreen extends StatefulWidget {
  const Myscreen({super.key});

  @override
  State<Myscreen> createState() => _MyscreenState();
}

bool _iconBol = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconBlack = Icons.nights_stay;

class _MyscreenState extends State<Myscreen> {
  bool oTurn = true;
  List<String> displayOX = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  List<int> seq = [];
  int drawCount = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Scaffold(
          appBar: AppBar(
            title: Text('T I C  T A C  T O E',
                style: Provider.of<MyProvider>(context).iconBol
                    ? AppTheme.dark.textTheme.titleSmall
                    : AppTheme.light.textTheme.titleSmall),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                onPressed: () {
                  setState(() {
                    Provider.of<MyProvider>(context, listen: false).iconBol =
                        !Provider.of<MyProvider>(context, listen: false)
                            .iconBol;
                  });
                },
                icon: Icon(_iconBol ? _iconBlack : _iconLight),
                color: Provider.of<MyProvider>(context).iconBol
                    ? Colors.white
                    : Colors.black,
              )
            ],
          ),
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X',
                            style: Provider.of<MyProvider>(context).iconBol
                                ? AppTheme.dark.textTheme.titleSmall
                                : AppTheme.light.textTheme.titleSmall),
                        SizedBox(height: 10),
                        Text(xScore.toString(),
                            style: Provider.of<MyProvider>(context).iconBol
                                ? AppTheme.dark.textTheme.titleSmall
                                : AppTheme.light.textTheme.titleSmall),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O',
                            style: Provider.of<MyProvider>(context).iconBol
                                ? AppTheme.dark.textTheme.titleSmall
                                : AppTheme.light.textTheme.titleSmall),
                        SizedBox(height: 10),
                        Text(oScore.toString(),
                            style: Provider.of<MyProvider>(context).iconBol
                                ? AppTheme.dark.textTheme.titleSmall
                                : AppTheme.light.textTheme.titleSmall)
                      ],
                    ),
                  ),
                ],
              )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 450,
                      maxWidth: 450,
                    ),
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: GestureDetector(
                              onTap: () {
                                _tapped(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color:
                                      Provider.of<MyProvider>(context).iconBol
                                          ? Colors.white
                                          : Colors.black,
                                )),
                                child: Center(
                                  child: Text(displayOX[index],
                                      style: Provider.of<MyProvider>(context)
                                              .iconBol
                                          ? AppTheme.dark.textTheme.titleLarge
                                          : AppTheme
                                              .light.textTheme.titleLarge),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Player ${oTurn ? 'O' : 'X'}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SpinKitThreeBounce(
                    color: Provider.of<MyProvider>(context).iconBol
                        ? Colors.white
                        : Colors.black,
                    size: 8,
                  )
                ]),
              ))
            ],
          ))),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayOX[index] == '' && !seq.contains(index)) {
        displayOX[index] = 'O';
        seq.add(index);
        drawCount++;
        oTurn = !oTurn;
      } else if (!oTurn && displayOX[index] == '' && !seq.contains(index)) {
        displayOX[index] = 'X';
        seq.add(index);
        oTurn = !oTurn;
        drawCount++;
      }
      //print(seq);
      _checkWinner(index);
    });
  }

  void _checkWinner(index) {
    //rows
    if (displayOX[0] == displayOX[1] &&
        displayOX[2] == displayOX[0] &&
        displayOX[0] != '') {
      _showDialog(index);
    }
    if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != '') {
      _showDialog(index);
    }
    if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != '') {
      _showDialog(index);
    } //columns
    if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != '') {
      _showDialog(index);
    }
    if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != '') {
      _showDialog(index);
    }
    if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != '') {
      _showDialog(index);
    }
    //diagonals
    if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != '') {
      _showDialog(index);
    }
    if (displayOX[2] == displayOX[4] &&
        displayOX[2] == displayOX[6] &&
        displayOX[2] != '') {
      _showDialog(index);
    }
    if (drawCount == 9) {
      _showDialogDraw(index);
    }
  }

  void _showDialog(int index) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Player ${displayOX[index]} Won',
                    style: GoogleFonts.lato(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            content: SizedBox(
              height: 200,
              child: Lottie.asset('animations/seawalk.json',
                  height: 100, repeat: true, fit: BoxFit.scaleDown),
            ),
            actions: <Widget>[
              TextButton.icon(
                onPressed: () {
                  _clearGame();
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.replay_outlined,
                  size: 30,
                  color: Provider.of<MyProvider>(context).iconBol
                      ? Colors.white
                      : Colors.black,
                ),
                label: Text(
                  'Play Again',
                  style: TextStyle(
                    color: Provider.of<MyProvider>(context).iconBol
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              )
            ],
          );
        });
    seq.clear();
    drawCount = 0;
    if (displayOX[index] == 'O') {
      oScore += 1;
    } else if (displayOX[index] == 'X') {
      xScore += 1;
    }
  }

  void _showDialogDraw(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Draw!',
                    style: GoogleFonts.lato(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            content: SizedBox(
              height: 200,
              child: Lottie.asset('animations/GG.json',
                  height: 100, repeat: true, fit: BoxFit.scaleDown),
            ),
            actions: <Widget>[
              TextButton.icon(
                onPressed: () {
                  _clearGame();
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.replay_outlined,
                  size: 30,
                  color: Provider.of<MyProvider>(context).iconBol
                      ? Colors.white
                      : Colors.black,
                ),
                label: Text(
                  'Play Again',
                  style: TextStyle(
                    color: Provider.of<MyProvider>(context).iconBol
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              )
            ],
          );
        });
    drawCount = 0;
    seq.clear();
  }

  void _clearGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayOX[i] = '';
      }
    });
  }
}
