import 'package:flutter/material.dart';

class PausedSessionScreen extends StatelessWidget {
  final String subject;
  final String topic;
  final String elapsedTime;

  const PausedSessionScreen({
    super.key,
    required this.subject,
    required this.topic,
    required this.elapsedTime,
  });

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
                    '${subject.toUpperCase()} SESSION',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Topic
                  Text(
                    topic,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // ON BREAK status text
                  Text(
                    'ON BREAK',
                    style: const TextStyle(
                      fontSize: 36,
                      color: Color(0xFF424242), // Dark gray
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // End Session button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Go back to previous screen
                        Navigator.of(context).pop(); // Go back to session setup
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'END SESSION',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Resume button
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
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
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Motivational quote
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Why don\'t you refresh your coffee ☕',
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
                    elapsedTime,
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
                      onPressed: () {
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
                      },
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
