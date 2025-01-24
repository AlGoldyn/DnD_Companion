import 'package:flutter/material.dart';

class SpellSlotProvider with ChangeNotifier {
  Map<String, Map<int, int>> spellSlotData = {
    'Wizard': {1: 2, 2: 3, 3: 4, 4: 4, 5: 3, 6: 3, 7: 2, 8: 1},
    'Sorcerer': {1: 3, 2: 4, 3: 4, 4: 3, 5: 3, 6: 3, 7: 2, 8: 1},
    'Cleric': {1: 2, 2: 3, 3: 4, 4: 4, 5: 3, 6: 3, 7: 2, 8: 1},
    'Druid': {1: 3, 2: 3, 3: 4, 4: 3, 5: 3, 6: 2, 7: 2, 8: 1},
    'Bard': {1: 2, 2: 3, 3: 3, 4: 3, 5: 2, 6: 2, 7: 1, 8: 1},
    'Paladin': {1: 2, 2: 3, 3: 3, 4: 2, 5: 2, 6: 2, 7: 1, 8: 1},
  };

  String _selectedClass = 'Wizard';
  int _selectedLevel = 1;
  Map<int, int> _spellSlots = {};

  String get selectedClass => _selectedClass;
  int get selectedLevel => _selectedLevel;
  Map<int, int> get spellSlots => _spellSlots;

  void loadSpellSlots(int level) {
  final allSlots = spellSlotData[_selectedClass] ?? {}; // Pobierz wszystkie sloty dla danej klasy

  // Tworzymy nową mapę, gdzie poziomy wyższe niż 'level' mają wartość 0
  _spellSlots = Map.fromEntries(
    allSlots.entries.map((entry) {
      if (entry.key <= level) {
        return MapEntry(entry.key, entry.value); // Normalna wartość
      } else {
        return MapEntry(entry.key, 0); // Ustaw 0 dla wyższych poziomów
      }
    }),
  );

  notifyListeners();
}

void changeClass(String newClass) {
  _selectedClass = newClass;
  loadSpellSlots(_selectedLevel); // Użyj aktualnego poziomu
}

void changeLevel(int newLevel) {
  _selectedLevel = newLevel;
  loadSpellSlots(newLevel); // Użyj nowego poziomu
}

  void useSpellSlot(int level) {
    if (_spellSlots.containsKey(level) && _spellSlots[level]! > 0) {
      _spellSlots[level] = _spellSlots[level]! - 1;
      notifyListeners();
    }
  }

  void resetSpellSlots() {
    _spellSlots = Map.from(spellSlotData[_selectedClass] ?? {});
    notifyListeners();
  }
}
