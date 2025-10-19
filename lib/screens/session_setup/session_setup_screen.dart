import 'package:flutter/material.dart';
import 'package:study_a/widgets/searchable_dropdown_field.dart';
import 'package:study_a/screens/timer/ongoing_session_screen.dart';

class SessionSetupScreen extends StatefulWidget {
  const SessionSetupScreen({super.key});

  @override
  State<SessionSetupScreen> createState() => _SessionSetupScreenState();
}

class _SessionSetupScreenState extends State<SessionSetupScreen> {
  bool _mockTest = false;
  bool _countDown = false;
  int _hours = 0;
  int _minutes = 0;
  int _breakReminder = 0;

  String? _subject;
  String? _topic;
  String? _mood;
  String? _location;
  String? _preset;

  List<String> get _subjects => const [
        'Maths', 'Biology', 'Chemistry', 'Physics', 'History', 'Turkish', 'Geography'
      ];
  List<String> get _topics => const [
        'Algebra', 'Calculus', 'Botany', 'Taxonomy', 'Mechanics', 'World War II'
      ];
  List<String> get _moods => const ['Sleepy', 'Inspired', 'Focused', 'Tired', 'Curious'];
  List<String> get _locations => const ['Home', 'Library', 'Cafe', 'School'];
  List<String> get _presets => const ['Preset 1', 'Preset 2', 'Preset 3'];

  void _begin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OngoingSessionScreen(
          subject: _subject ?? 'Biology',
          topic: _topic ?? 'Taxonomy',
          hours: _hours,
          minutes: _minutes,
          isCountdown: _countDown,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeText = (_hours.toString().padLeft(2, '0')) + ':' + (_minutes.toString().padLeft(2, '0'));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section: back arrow, centered big icon
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    // Back triangle (bigger)
                    Positioned(
                      left: 4,
                      top: 4,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        iconSize: 32,
                        icon: const RotatedBox(quarterTurns: 2, child: Icon(Icons.play_arrow)),
                      ),
                    ),
                    // Center icon
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.menu_book_rounded, size: 120),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Mock Test Mode text and toggle (left side, above Duration)
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mock Test Mode',
                        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 8),
                      Switch(value: _mockTest, onChanged: (v) => setState(() => _mockTest = v)),
                    ],
                  ),
                  const Spacer(),
                  // Begin button aligned with Timer toggle
                  _beginButton(_begin),
                ],
              ),
              const SizedBox(height: 16),
              // Duration row with countdown toggle
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _PillLabel(text: 'Duration'),
                  const SizedBox(width: 12),
                  _NumberSpinnerPill(
                    value: _hours,
                    onChanged: (v) => setState(() => _hours = v.clamp(0, 23)),
                    max: 23,
                  ),
                  const SizedBox(width: 12),
                  _NumberSpinnerPill(
                    value: _minutes,
                    onChanged: (v) => setState(() => _minutes = v.clamp(0, 59)),
                    max: 59,
                  ),
                  const SizedBox(width: 16),
                  const _PillLabel(text: 'Timer'),
                  const SizedBox(width: 8),
                  Flexible(child: Align(alignment: Alignment.centerLeft, child: Switch(value: _countDown, onChanged: (v) => setState(() => _countDown = v)))),
                ],
              ),
              const SizedBox(height: 16),
              // Subjects row
              _FieldRow(
                label: 'Subjects',
                child: SearchableDropdownField(
                  label: '',
                  options: _subjects,
                  initialValue: _subject,
                  onChanged: (v) => setState(() => _subject = v),
                  hintText: 'Biology',
                ),
              ),
              if ((_subject ?? '').isNotEmpty) ...[
                const SizedBox(height: 6),
                _SelectionChip(text: _subject!),
              ],
              const SizedBox(height: 12),
              // Topics row
              _FieldRow(
                label: 'Topics',
                child: SearchableDropdownField(
                  label: '',
                  options: _topics,
                  initialValue: _topic,
                  onChanged: (v) => setState(() => _topic = v),
                  hintText: 'Plants',
                ),
              ),
              if ((_topic ?? '').isNotEmpty) ...[
                const SizedBox(height: 6),
                _SelectionChip(text: _topic!),
              ],
              const SizedBox(height: 16),
              // Break reminder row
              Row(
                children: [
                  const _PillLabel(text: 'Break reminder'),
                  const SizedBox(width: 12),
                  _NumberSpinnerPill(
                    value: _breakReminder,
                    onChanged: (v) => setState(() => _breakReminder = v.clamp(0, 120)),
                    max: 120,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Mood row
              _FieldRow(
                label: 'I feel',
                child: SearchableDropdownField(
                  label: '',
                  options: _moods,
                  initialValue: _mood,
                  onChanged: (v) => setState(() => _mood = v),
                  hintText: 'Inspired',
                ),
              ),
              if ((_mood ?? '').isNotEmpty) ...[
                const SizedBox(height: 6),
                _SelectionChip(text: _mood!),
              ],
              const SizedBox(height: 12),
              // Location row
              _FieldRow(
                label: "I'm at",
                child: SearchableDropdownField(
                  label: '',
                  options: _locations,
                  initialValue: _location,
                  onChanged: (v) => setState(() => _location = v),
                  hintText: 'Library',
                ),
              ),
              if ((_location ?? '').isNotEmpty) ...[
                const SizedBox(height: 6),
                _SelectionChip(text: _location!),
              ],
              const SizedBox(height: 12),
              // Preset row
              _FieldRow(
                label: 'Use Preset',
                child: SearchableDropdownField(
                  label: '',
                  options: _presets,
                  initialValue: _preset,
                  onChanged: (v) => setState(() => _preset = v),
                  hintText: 'Preset 3',
                ),
              ),
              if ((_preset ?? '').isNotEmpty) ...[
                const SizedBox(height: 6),
                _SelectionChip(text: _preset!),
              ],
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: () {}, child: const Text('Save this session as a preset')),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

}

class _NumberSpinnerPill extends StatelessWidget {
  const _NumberSpinnerPill({
    required this.value,
    required this.onChanged,
    required this.max,
    this.min = 0,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final int max;
  final int min;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 74,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value.toString().padLeft(2, '0'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TriangleIconButton(
                onTap: () => onChanged((value + 1) <= max ? value + 1 : max),
                direction: _TriangleDirection.up,
              ),
              const SizedBox(height: 4),
              _TriangleIconButton(
                onTap: () => onChanged((value - 1) >= min ? value - 1 : min),
                direction: _TriangleDirection.down,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  const _FieldRow({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: _PillLabel(text: label, height: 48)),
        const SizedBox(width: 12),
        Expanded(flex: 7, child: child),
      ],
    );
  }
}

class _PillLabel extends StatelessWidget {
  const _PillLabel({required this.text, this.height});
  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.06),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _SelectionChip extends StatelessWidget {
  const _SelectionChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }
}

Widget _beginButton(VoidCallback onPressed) {
  return FilledButton(
    onPressed: onPressed,
    style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('Begin'),
        SizedBox(width: 8),
        Icon(Icons.play_arrow),
      ],
    ),
  );
}

enum _TriangleDirection { up, down }

class _TriangleIconButton extends StatelessWidget {
  const _TriangleIconButton({required this.onTap, required this.direction});
  final VoidCallback onTap;
  final _TriangleDirection direction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 20,
        height: 16,
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: direction == _TriangleDirection.up ? 0 : 3.14159,
          child: Icon(Icons.change_history, size: 14, color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}

