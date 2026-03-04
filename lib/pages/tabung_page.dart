import 'package:flutter/material.dart';
import 'dart:math';

class TabungPage extends StatefulWidget {
  const TabungPage({super.key});

  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final TextEditingController jariController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  double hasil = 0;

  void hitungVolume() {
    double r = double.tryParse(jariController.text) ?? 0;
    double t = double.tryParse(tinggiController.text) ?? 0;

    setState(() {
      hasil = pi * r * r * t;
    });
  }

  @override
  void dispose() {
    jariController.dispose();
    tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2E4A7D),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // BACK BUTTON
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: 10),

                // TITLE
                const Text(
                  "Tabung",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Hitung volume tabung dengan mudah",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 30),

                // WHITE CARD
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        const Text(
                          "Rumus",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "V = π × r × r × t",
                          style: TextStyle(fontSize: 18),
                        ),

                        const SizedBox(height: 25),

                        TextField(
                          controller: jariController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Masukkan jari-jari",
                            prefixIcon: const Icon(Icons.circle_outlined),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        TextField(
                          controller: tinggiController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Masukkan tinggi",
                            prefixIcon: const Icon(Icons.height),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E4A7D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: hitungVolume,
                            child: const Text(
                              "Hitung Volume",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Hasil: $hasil",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E4A7D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}