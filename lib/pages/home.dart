import 'package:flutter/material.dart';
import 'package:kuis/models/pokemon.dart';
import 'package:kuis/pages/details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 180, 40),
        foregroundColor: const Color.fromARGB(255, 243, 220, 255),
        centerTitle: true,
        title: Text('Pokemon App'),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetails(pokemon: pokemon), 
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    //memotong gambar jd melengkung
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      pokemon.image,
                      width: double.infinity,
                      height: 100, //panjang gambarnya
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Wrap(
                    //supaya habitat itu bisa ke bawah kalo cardnya habis
                    spacing: 4, //jarak horizontal antar chip (kiri kanan)
                    runSpacing: 4, //jarak vertikal antar baris
                    children: pokemon.types.map((h) {
                      return Container(
                        //bentuk 1 chip
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(h, style: const TextStyle(fontSize: 10)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
