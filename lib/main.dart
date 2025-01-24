import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/spell_provider.dart';
import './providers/spell_slot_provider.dart'; 
import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SpellProvider()),
        ChangeNotifierProvider(create: (context) => SpellSlotProvider()), // Added SpellSlotProvider
      ],
      child: MaterialApp(
        title: 'D&D Spells',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
