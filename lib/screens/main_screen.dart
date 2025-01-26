import 'package:dziala/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './spell_slot_screen.dart';
import './dice_screen.dart';
import './spell_search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Lista ekranów
  final List<Widget> _screens = [
    DiceScreen(), // Ekran kostek
    SpellSearchScreen(), // Ekran wyszukiwania czarów
    SpellSlotScreen(), // Ekran slotów czarów
  ];

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AuthWrapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D&D Companion'), // Tytuł aplikacji
      ),
      body: _screens[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('D&D Companion'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('logout'),
              onTap: () async {
                await logout(context); // Wylogowanie użytkownika
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Zmiana ekranu
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            label: 'Dice', // Zmiana etykiety na angielski
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Spells', // Zmiana etykiety na angielski
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spellcheck),
            label: 'Spell Slots', // Zmiana etykiety na angielski
          ),
        ],
      ),
    );
  }
}
