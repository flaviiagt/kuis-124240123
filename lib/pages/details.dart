import 'package:flutter/material.dart';
import 'package:kuis/models/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon; //deklarasiin dulu fieldnya
  const PokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pokemon.name),
         backgroundColor: const Color.fromARGB(255, 255, 180, 40),
        foregroundColor: const Color.fromARGB(255, 243, 220, 255),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12), //kalo cm bbrp sisi pake .only (topLeft, dll)
              child: Image.network(
                pokemon.image,
                width: double.infinity,
                fit: BoxFit.contain, //kalo mau ngisi penuh boxnya pake .cover dan pake height
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Pokemon Types',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: pokemon.types.map((types) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(types),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            const Text(
              'Attributes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('id : ${pokemon.id}'),
            Text('Height : ${pokemon.height}'),
            Text('Weight : ${pokemon.weight}'),
            Text('Habitat : ${pokemon.ability}'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
