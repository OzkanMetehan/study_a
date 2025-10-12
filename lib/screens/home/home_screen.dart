import 'package:flutter/material.dart';
import 'package:study_a/screens/session_setup/session_setup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = TimeOfDay.now();
    final timeString = now.format(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7E7CE), Color(0xFFE6F3F4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Hi, User!'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(child: Icon(Icons.person)),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Streak chip
              Align(
                alignment: Alignment.centerLeft,
                child: Chip(label: Row(mainAxisSize: MainAxisSize.min, children: const [Icon(Icons.local_fire_department, size: 16, color: Colors.orange), SizedBox(width: 6), Text('13')]))
              ),
              const SizedBox(height: 12),
              // Target Progress placeholder card
              _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Studied this week/month'),
                SizedBox(height: 8),
                LinearProgressIndicator(value: 0.6),
                SizedBox(height: 6),
                Text('2 h 34 m / 8 h')
              ])),
              const SizedBox(height: 16),
              // Today’s Plan header
              const Text("Today's Plan", style: TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              SizedBox(
                height: 84,
                child: Row(children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_left)),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => _subjectCard(i.isEven ? 'Turkish' : 'History', i.isEven ? '5:45 PM' : '8:30 PM'),
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemCount: 4,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_right)),
                ]),
              ),
              const SizedBox(height: 16),
              // Start Studying card
              _card(child: Column(children: [
                Text(timeString, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SessionSetupScreen()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text('Start Studying', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ])),
              const SizedBox(height: 16),
              // Previous Session placeholder card
              _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Previous Session'),
                SizedBox(height: 12),
                Text('Geography / Maths'),
                SizedBox(height: 8),
                Text('Duration 1:24:51  •  Solved 75  •  Pauses 3'),
                SizedBox(height: 8),
                Text('Net 59  •  Accuracy 80%')
              ])),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _card({required Widget child}) {
  return Card(
    elevation: 0,
    color: Colors.white.withOpacity(0.9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(padding: const EdgeInsets.all(16), child: child),
  );
}

Widget _subjectCard(String title, String time) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(children: [
        const Icon(Icons.menu_book_outlined),
        const SizedBox(width: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(time, style: const TextStyle(color: Colors.grey))])
      ]),
    ),
  );
}

// Removed redundant bottom navigation stub that duplicated the app shell's bar
