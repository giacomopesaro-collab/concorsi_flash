import 'package:flutter/material.dart';

void main() {
  runApp(const ConcorsiFlashApp());
}

class ConcorsiFlashApp extends StatelessWidget {
  const ConcorsiFlashApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concorsi Flash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const deepBlue = Color(0xFF0D1B2A);
    const gold = Color(0xFFD4AF37);
    const background = deepBlue;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // HEADER - Contatore Domande
              Row(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                    child: Row(
                      children: [
                        const Icon(Icons.flash_on_rounded, color: gold, size: 26),
                        const SizedBox(width: 7),
                        const Text(
                          "Domande: ",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "10/10",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // DASHBOARD CARDS
              Row(
                children: [
                  _buildDashboardCard(
                    context, 
                    'Allenamento\nRapido', 
                    Icons.bolt_rounded, 
                    gold, 
                    false
                  ),
                  const SizedBox(width: 16),
                  _buildDashboardCard(
                    context, 
                    'Simulazione\nConcorso', 
                    Icons.timer_rounded, 
                    Colors.white, 
                    true,
                    gold: gold
                  ),
                ],
              ),
              
              const SizedBox(height: 44),
              
              // TASTO CARICA PDF
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.upload_file_rounded, color: gold, size: 26),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Carica PDF per iniziare'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.05),
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: gold, width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // FOOTER - XP BAR
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Livello 1: Recluta',
                    style: TextStyle(color: gold, fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const SizedBox(height: 7),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: const LinearProgressIndicator(
                      value: 0.1, // Un po' di progresso per vederla
                      minHeight: 12,
                      backgroundColor: Colors.white10,
                      valueColor: AlwaysStoppedAnimation<Color>(gold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text('10/100 XP', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color iconColor, bool isPro, {Color? gold}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(icon, color: iconColor, size: 40),
                if (isPro) Icon(Icons.lock_rounded, color: gold, size: 18),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            if (isPro) Text("PRO", style: TextStyle(color: gold, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
          ],
        ),
      ),
    );
  }
}