import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  // Mock data
  final List<Map<String, dynamic>> _subjects = [
    {
      'name': 'Turkish',
      'accuracy': 0.93,
      'questions': 519,
      'hours': 9.7,
      'qpm': 0.87,
      'topics': [
        {'name': 'Punctuation', 'correct': 74, 'wrong': 23},
        {'name': 'Idioms', 'correct': 44, 'wrong': 4},
      ]
    },
    {
      'name': 'Philosophy',
      'accuracy': 0.91,
      'questions': 402,
      'hours': 6.2,
      'qpm': 0.81,
      'topics': [
        {'name': 'Ancients', 'correct': 58, 'wrong': 12},
        {'name': 'Modern', 'correct': 39, 'wrong': 9},
      ]
    },
    {
      'name': 'Geography',
      'accuracy': 0.90,
      'questions': 377,
      'hours': 5.6,
      'qpm': 0.82,
      'topics': [
        {'name': 'Climates', 'correct': 61, 'wrong': 11},
        {'name': 'Rivers', 'correct': 52, 'wrong': 8},
      ]
    },
    {
      'name': 'Biology',
      'accuracy': 0.79,
      'questions': 288,
      'hours': 4.1,
      'qpm': 0.75,
      'topics': [
        {'name': 'Cells', 'correct': 41, 'wrong': 9},
        {'name': 'Genetics', 'correct': 33, 'wrong': 12},
      ]
    },
    {
      'name': 'Math',
      'accuracy': 0.83,
      'questions': 610,
      'hours': 11.4,
      'qpm': 0.89,
      'topics': [
        {'name': 'Algebra', 'correct': 72, 'wrong': 15},
        {'name': 'Geometry', 'correct': 51, 'wrong': 14},
      ]
    },
    {
      'name': 'Physics',
      'accuracy': 0.72,
      'questions': 255,
      'hours': 4.9,
      'qpm': 0.78,
      'topics': [
        {'name': 'Mechanics', 'correct': 38, 'wrong': 16},
        {'name': 'Optics', 'correct': 29, 'wrong': 11},
      ]
    },
    {
      'name': 'Chemistry',
      'accuracy': 0.69,
      'questions': 233,
      'hours': 4.3,
      'qpm': 0.74,
      'topics': [
        {'name': 'Organic', 'correct': 26, 'wrong': 12},
        {'name': 'Inorganic', 'correct': 22, 'wrong': 10},
      ]
    },
    {
      'name': 'History',
      'accuracy': 0.86,
      'questions': 341,
      'hours': 6.8,
      'qpm': 0.84,
      'topics': [
        {'name': 'Ottomans', 'correct': 57, 'wrong': 9},
        {'name': 'WWII', 'correct': 43, 'wrong': 8},
      ]
    },
    {
      'name': 'Religion',
      'accuracy': 0.88,
      'questions': 198,
      'hours': 3.6,
      'qpm': 0.77,
      'topics': [
        {'name': 'Ethics', 'correct': 33, 'wrong': 6},
        {'name': 'Beliefs', 'correct': 28, 'wrong': 5},
      ]
    },
  ];

  String _sortBy = 'accuracy'; // accuracy | questions | hours
  bool _descending = true; // most->least
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _headerTitle('Analytics'),
                const SizedBox(height: 12),
                _summaryCard(),
                const SizedBox(height: 12),
                _strengthsCard(
                  sortBy: _sortBy,
                  descending: _descending,
                  subjects: _subjects,
                  selectedIndex: _selectedIndex,
                  onChangeSort: (v) => setState(() => _sortBy = v),
                  onToggleDescending: (b) => setState(() => _descending = b),
                  onSelect: (i) => setState(() => _selectedIndex = i),
                ),
                const SizedBox(height: 12),
                _studyTimeCard(),
                const SizedBox(height: 12),
                _insightsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _headerTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF2D3748),
    ),
  );
}

Widget _card({required Widget child}) {
  return Card(
    elevation: 0,
    color: Colors.white.withOpacity(0.9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(padding: const EdgeInsets.all(16), child: child),
  );
}

Widget _summaryCard() {
  return _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Summary', style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Row(
          children: [
            _kpi('Solved', '3311'),
            const SizedBox(width: 12),
            _kpi('Hours', '59 h'),
            const SizedBox(width: 12),
            _kpi('Sessions', '38'),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFF7FAFC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Text('Mini chart')), // placeholder
        )
      ],
    ),
  );
}

Widget _kpi(String label, String value) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF718096))),
        ],
      ),
    ),
  );
}

Widget _sortControls({
  required String sortBy,
  required ValueChanged<String> onChangeSort,
}) {
  return GestureDetector(
    onTap: () {
      // Cycle through sort options
      final options = ['accuracy', 'questions', 'hours'];
      final currentIndex = options.indexOf(sortBy);
      final nextIndex = (currentIndex + 1) % options.length;
      onChangeSort(options[nextIndex]);
    },
    child: Text(
      sortBy.toUpperCase(),
      style: const TextStyle(
        fontSize: 8,
        color: Color(0xFF2D3748),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _subjectsList({
  required List<Map<String, dynamic>> subjects,
  required String sortBy,
  required bool descending,
  required int selectedIndex,
  required ValueChanged<int> onSelect,
}) {
  return SizedBox(
    height: 220,
    child: Builder(builder: (context) {
      List<Map<String, dynamic>> data = List.of(subjects);
      int comparator(a, b) {
        switch (sortBy) {
          case 'questions':
            return (a['questions'] as int).compareTo(b['questions'] as int);
          case 'hours':
            return (a['hours'] as double).compareTo(b['hours'] as double);
          default:
            return (a['accuracy'] as double).compareTo(b['accuracy'] as double);
        }
      }
      data.sort(comparator);
      if (descending) data = data.reversed.toList();

      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (_, i) {
          final item = data[i];
          final currentIndex = subjects.indexWhere((s) => s['name'] == item['name']);
          final bool selected = selectedIndex == currentIndex;
          return InkWell(
            onTap: () => onSelect(currentIndex),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFFFF1CC) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10))),
                  Text('${((item['accuracy'] as double) * 100).round()}%', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10)),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemCount: data.length,
      );
    }),
  );
}

Widget _subjectDetailPanel({required Map<String, dynamic> subject}) {
  return Builder(builder: (context) {
    final topics = subject['topics'] as List<dynamic>;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFBEE3F8).withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header metrics
          Row(
            children: [
              Text(subject['name'], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10)),
              const SizedBox(width: 8),
              const Icon(Icons.access_time, size: 8, color: Color(0xFF718096)),
              Text(' ${subject['hours'].toStringAsFixed(1)} h', style: const TextStyle(fontSize: 6, color: Color(0xFF718096))),
              const SizedBox(width: 6),
              const Icon(Icons.quiz, size: 8, color: Color(0xFF718096)),
              Text(' ${subject['questions']}', style: const TextStyle(fontSize: 6, color: Color(0xFF718096))),
              const SizedBox(width: 6),
              const Icon(Icons.speed, size: 8, color: Color(0xFF718096)),
              Text(' ${subject['qpm'].toStringAsFixed(2)} qpm', style: const TextStyle(fontSize: 6, color: Color(0xFF718096))),
            ],
          ),
          const SizedBox(height: 10),
          // Topics list
          Column(
            children: topics.map((t) {
              final int correct = t['correct'] as int;
              final int wrong = t['wrong'] as int;
              final int total = correct + wrong;
              final double pct = total == 0 ? 0 : correct / total;
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t['name'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10)),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(height: 12, decoration: BoxDecoration(color: const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(6))),
                        FractionallySizedBox(
                          widthFactor: pct,
                          child: Container(height: 12, decoration: BoxDecoration(color: const Color(0xFF9AE6B4), borderRadius: BorderRadius.circular(6))),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _pill(correct.toString(), const Color(0xFF9AE6B4)),
                              const SizedBox(width: 4),
                              _pill(wrong.toString(), const Color(0xFFF8B4B4)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  });
}

Widget _pill(String text, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
    child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
  );
}
Widget _strengthsCard({
  required String sortBy,
  required bool descending,
  required List<Map<String, dynamic>> subjects,
  required int selectedIndex,
  required ValueChanged<String> onChangeSort,
  required ValueChanged<bool> onToggleDescending,
  required ValueChanged<int> onSelect,
}) {
  return _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Strengths', style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        LayoutBuilder(builder: (ctx, cons) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left list + sort controls
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F3F4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: const BoxConstraints(minHeight: 220, maxHeight: 220),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sortControls(
                              sortBy: sortBy,
                              onChangeSort: onChangeSort,
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: _subjectsList(
                                subjects: subjects,
                                sortBy: sortBy,
                                descending: descending,
                                selectedIndex: selectedIndex,
                                onSelect: onSelect,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Right detail panel
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 220),
                    child: _subjectDetailPanel(subject: subjects[selectedIndex]),
                  ),
                ),
              ),
            ],
          );
        })
      ],
    ),
  );
}

Widget _studyTimeCard() {
  return _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Study Time', style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(7, (i) {
              final heights = [40.0, 60.0, 80.0, 50.0, 100.0, 70.0, 30.0];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: heights[i],
                            decoration: BoxDecoration(
                              color: const Color(0xFFBEE3F8),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(['Mon','Tue','Wed','Thu','Fri','Sat','Sun'][i], style: const TextStyle(fontSize: 10, color: Color(0xFF718096))),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    ),
  );
}

Widget _insightsCard() {
  Widget tip(String title, String desc) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(desc, style: const TextStyle(fontSize: 12, color: Color(0xFF718096))),
          ],
        ),
      );

  return _card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Insights', style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Column(
          children: [
            tip('Great consistency last week', 'Your daily streak was saved 5 times.'),
            const SizedBox(height: 8),
            tip('Focus on Physics', 'Accuracy dropped to 54% in the last 3 sessions.'),
            const SizedBox(height: 8),
            tip('Nice work on Biology', 'Solved 420 questions this month, up 18%.'),
          ],
        )
      ],
    ),
  );
}
