import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/spell_provider.dart';
import './providers/spell_slot_provider.dart';
import './screens/main_screen.dart';
import './screens/login_screen.dart'; // Importujemy ekran logowania
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth do sprawdzenia użytkownika

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SpellProvider()),
        ChangeNotifierProvider(create: (context) => SpellSlotProvider()),
      ],
      child: MaterialApp(
        title: 'D&D Spells',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthWrapper(), // Używamy AuthWrapper zamiast MainScreen
      ),
    );
  }
}

// Dodajemy AuthWrapper jako kontroler widoków
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Nasłuchujemy zmian stanu użytkownika
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Ekran ładowania
        }
        if (snapshot.hasData) {
          return MainScreen(); // Użytkownik zalogowany -> pokazujemy MainScreen
        } else {
          return LoginScreen(); // Użytkownik niezalogowany -> pokazujemy LoginScreen
        }
      },
    );
  }
}
