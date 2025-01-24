class SpellSlot {
  final int level; // Poziom zaklęcia
  final int maxSlots; // Maksymalna liczba slotów
  int currentSlots; // Aktualna liczba slotów

  SpellSlot({
    required this.level,
    required this.maxSlots,
  }) : currentSlots = maxSlots;
}

class CharacterClass {
  final String name; // Nazwa klasy (np. Wizard, Cleric)
  final Map<int, List<SpellSlot>> spellSlotsByLevel;

  CharacterClass({required this.name, required this.spellSlotsByLevel});
}

final List<CharacterClass> characterClasses = [
  CharacterClass(
    name: 'Wizard',
    spellSlotsByLevel: {
      1: [SpellSlot(level: 1, maxSlots: 2)],
      2: [SpellSlot(level: 1, maxSlots: 3)],
      3: [SpellSlot(level: 1, maxSlots: 4), SpellSlot(level: 2, maxSlots: 2)],
      // Dodaj więcej poziomów
    },
  ),
  CharacterClass(
    name: 'Cleric',
    spellSlotsByLevel: {
      1: [SpellSlot(level: 1, maxSlots: 2)],
      2: [SpellSlot(level: 1, maxSlots: 3)],
      3: [SpellSlot(level: 1, maxSlots: 4), SpellSlot(level: 2, maxSlots: 2)],
      // Dodaj więcej poziomów
    },
  ),
  // Dodaj inne klasy...
];
