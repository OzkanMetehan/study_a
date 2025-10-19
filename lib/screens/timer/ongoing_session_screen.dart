import 'dart:async';
import 'package:flutter/material.dart';
import 'package:study_a/screens/timer/paused_session_screen.dart';

class OngoingSessionScreen extends StatefulWidget {
  final String subject;
  final String topic;
  final int hours;
  final int minutes;
  final bool isCountdown;

  const OngoingSessionScreen({
    super.key,
    required this.subject,
    required this.topic,
    required this.hours,
    required this.minutes,
    required this.isCountdown,
  });

  @override
  State<OngoingSessionScreen> createState() => _OngoingSessionScreenState();
}

class _OngoingSessionScreenState extends State<OngoingSessionScreen> {
  bool _isPaused = false;
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  Duration _targetDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _targetDuration = Duration(hours: widget.hours, minutes: widget.minutes);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        setState(() {
          if (widget.isCountdown) {
            _elapsedTime = _targetDuration - Duration(seconds: timer.tick);
            if (_elapsedTime <= Duration.zero) {
              _elapsedTime = Duration.zero;
              _endSession();
            }
          } else {
            _elapsedTime = Duration(seconds: timer.tick);
          }
        });
      }
    });
  }

  void _togglePause() {
    if (_isPaused) {
      // Resume session
      setState(() {
        _isPaused = false;
      });
    } else {
      // Pause session - navigate to paused screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PausedSessionScreen(
            subject: widget.subject,
            topic: widget.topic,
            elapsedTime: _formatDuration(_elapsedTime),
          ),
        ),
      );
    }
  }

  void _endSession() {
    _timer?.cancel();
    Navigator.of(context).pop();
  }

  void _takeNote() {
    // TODO: Implement note-taking functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Take a Note'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Write your note here...',
            border: OutlineInputBorder(),
          ),
          maxLines: 4,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/session-background-1.png'),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: Column(
                children: [
                  const SizedBox(height: 40),
                  
                  // Session title
                  Text(
                    '${widget.subject.toUpperCase()} SESSION',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Topic with add icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.topic,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  
                  const Spacer(),
                  
                  // Main pause/play button
                  GestureDetector(
                    onTap: _togglePause,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.6),
                          width: 4,
                        ),
                      ),
                      child: const Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Motivational quote
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'With great power comes great responsibility',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.9),
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Timer display
                  Text(
                    _formatDuration(_elapsedTime),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Take a note button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: FilledButton(
                      onPressed: _takeNote,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Take a note',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
        ),
      ),
    );
  }
}
