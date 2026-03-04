import 'package:flutter/material.dart';
import 'kubus_page.dart';
import 'piramid_page.dart';
import 'tabung_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget buildMenuCard(
    BuildContext context,
    String title,
    String imagePath,
    Widget page,
    Color accentColor,
  ) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              // ICON CIRCLE
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha:0.15),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E3C72),
              Color(0xFF2A5298),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ===== BACK ARROW =====
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

                // ===== TITLE =====
                const Text(
                  "Pilih Bangun Ruang",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Pilih salah satu untuk menghitung volume",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 40),

                // ===== MENU CARDS =====
                buildMenuCard(
                  context,
                  "Kubus",
                  "assets/kubus.png",
                  const KubusPage(),
                  Colors.blue,
                ),

                const SizedBox(height: 20),

                buildMenuCard(
                  context,
                  "Piramid",
                  "assets/piramid.png",
                  const PiramidPage(),
                  Colors.orange,
                ),

                const SizedBox(height: 20),

                buildMenuCard(
                  context,
                  "Tabung",
                  "assets/tabung.png",
                  const TabungPage(),
                  Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}