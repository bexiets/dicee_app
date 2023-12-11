import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Dicee'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: const DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void diceRoll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void resetDice() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: IconButton(
                splashColor: Colors.transparent,
                splashRadius: 0.1,
                onPressed: () {
                  diceRoll();
                },
                icon: Image.asset(
                  'assets/images/dice$leftDiceNumber.png',
                  color: Colors.white,
                )),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
                splashColor: Colors.transparent,
                splashRadius: 0.1,
                onPressed: () {
                  diceRoll();
                },
                icon: Image.asset(
                  'assets/images/dice$rightDiceNumber.png',
                  color: Colors.white,
                )
              ),
          ),
        ],
      ),
    );
  }
}
