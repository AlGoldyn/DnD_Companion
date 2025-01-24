import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/spell_slot_provider.dart';

class SpellSlotScreen extends StatefulWidget {
  @override
  _SpellSlotScreenState createState() => _SpellSlotScreenState();
}

class _SpellSlotScreenState extends State<SpellSlotScreen> {
  String selectedClass = 'Wizard';
  int selectedLevel = 1;

  @override
  Widget build(BuildContext context) {
    final spellSlotProvider = Provider.of<SpellSlotProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Spell Slots'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Dropdown do wyboru klasy
              DropdownButton<String>(
                value: selectedClass,
                items: spellSlotProvider.spellSlotData.keys
                    .map((characterClass) => DropdownMenuItem(
                          value: characterClass,
                          child: Text(characterClass),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedClass = value!;
                  });
                },
              ),
              // Dropdown do wyboru poziomu
              DropdownButton<int>(
                value: selectedLevel,
                items: List.generate(
                  8,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('Level ${index + 1}'),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedLevel = value!;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Zastosowanie wyboru klasy i poziomu
              spellSlotProvider.changeClass(selectedClass);
              spellSlotProvider.changeLevel(selectedLevel);
            },
            child: Text('Apply Class and Level'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: spellSlotProvider.spellSlots.keys.length,
              itemBuilder: (context, index) {
                var level = spellSlotProvider.spellSlots.keys.elementAt(index);
                var availableSlots = spellSlotProvider.spellSlots[level]!;

                return ListTile(
                  title: Text('Spell Level $level'),
                  subtitle: Text('$availableSlots slots available'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      spellSlotProvider.useSpellSlot(level);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              spellSlotProvider.resetSpellSlots();
            },
            child: Text('Long Rest'),
          ),
        ],
      ),
    );
  }
}
