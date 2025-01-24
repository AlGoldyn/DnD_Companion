import 'package:flutter/material.dart';
import 'dart:math';

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  // Wartości wybrane przez użytkownika
  int _numRolls = 1; // Number of rolls
  int _numSides = 6; // Default is d6
  List<int> _rollResults = [];

  // Funkcja do losowania wyników
  void _rollDice() {
    _rollResults.clear(); // Clear previous results
    Random random = Random();
    for (int i = 0; i < _numRolls; i++) {
      _rollResults.add(random.nextInt(_numSides) + 1);
    }
    setState(() {});
  }

  // Funkcja wyświetlająca dialog do wyboru liczby rzutów
  void _showRollsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select number of rolls"),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter number of rolls (1-99)"),
            onChanged: (value) {
              setState(() {
                _numRolls = int.tryParse(value) ?? 1;
                if (_numRolls < 1) _numRolls = 1;
                if (_numRolls > 99) _numRolls = 99;
              });
            },
            controller: TextEditingController()..text = _numRolls.toString(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Funkcja wyświetlająca dialog do wyboru typu kości
  void _showSidesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select dice type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("d4"),
                onTap: () {
                  setState(() {
                    _numSides = 4;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("d6"),
                onTap: () {
                  setState(() {
                    _numSides = 6;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("d8"),
                onTap: () {
                  setState(() {
                    _numSides = 8;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("d10"),
                onTap: () {
                  setState(() {
                    _numSides = 10;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("d12"),
                onTap: () {
                  setState(() {
                    _numSides = 12;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("d20"),
                onTap: () {
                  setState(() {
                    _numSides = 20;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Suma wyników
    int totalSum = _rollResults.fold(0, (sum, item) => sum + item);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Rolls'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Górna część: dwa przyciski (po lewej i prawej)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Przycisk po lewej stronie - Liczba rzutów
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _showRollsDialog,
                  child: Text("Number of Rolls: $_numRolls"),
                ),
              ),

              // Przycisk po prawej stronie - Wybór kości
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _showSidesDialog,
                  child: Text("Dice Type: d$_numSides"),
                ),
              ),
            ],
          ),

          // Dolna część: przycisk "Losuj"
          ElevatedButton(
            onPressed: _rollDice,
            child: Text("Roll"),
          ),

          // Przewijany widok wyników
          if (_rollResults.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Text(
                              "Sum:",
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              "$totalSum",
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      // Wyniki rzutów
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _rollResults
                            .map((result) => Text(
                                  "$result",
                                  style: TextStyle(fontSize: 24),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
