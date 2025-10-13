import 'package:flutter/material.dart';
import 'dart:math' as math;

// Simple data model for a calendar day cell
class _CalendarDay {
  final int? day;
  final bool isCurrentMonth;
  const _CalendarDay(this.day, this.isCurrentMonth);
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentMonth = DateTime(2025, 9, 1); // September 2025
  int _selectedDay = 26; // Day 26 is selected as shown in the image
  int _selectedSubjectIndex = 0; // Total is selected
  bool _showWarningPopup = false;

  final List<String> _subjects = ['Total', 'Biology', 'Chemistry'];
  
  // Calendar data for September 2025
  final Map<int, Map<String, dynamic>> _calendarData = {
    4: {'type': 'selected', 'questions': 120, 'sessions': 2},
    6: {'type': 'rest_day', 'icon': 'palm_tree'},
    11: {'type': 'activity', 'questions': 85},
    12: {'type': 'activity', 'questions': 92},
    15: {'type': 'activity', 'icon': 'check'},
    16: {'type': 'sick', 'icon': 'sick'},
    19: {'type': 'activity', 'questions': 78},
    20: {'type': 'activity', 'questions': 95},
    21: {'type': 'activity', 'questions': 110},
    25: {'type': 'rest_day', 'icon': 'palm_tree'},
    26: {'type': 'special', 'questions': 120, 'sessions': 2, 'icon': 'crown'},
  };

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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                  // Calendar Header (with month + progress)
                  _buildCalendarHeader(),
                    
                    // Calendar Grid
                    _buildCalendarGrid(),
                    
                    // Legend
                    _buildLegend(),
                    
                    // Daily Summary
                    _buildDailySummary(),
                  ],
                ),
              ),
              
              // Warning Popup
              if (_showWarningPopup) _buildWarningPopup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _headerChevron(onTap: () {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
                });
              }, isLeft: true),
              Text(
                _getMonthYearString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D3748),
                ),
              ),
              _headerChevron(onTap: () {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
                });
              }),
            ],
          ),
          const SizedBox(height: 8),
          // Progress text + bar centered under header
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Solved, 3311 questions this month ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  Icon(Icons.flag, size: 14, color: Color(0xFF2D3748)),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.83,
                    backgroundColor: Color(0xFFE2E8F0),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF48BB78)),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '689 away from target',
                style: TextStyle(fontSize: 11, color: Color(0xFF718096)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerChevron({required VoidCallback onTap, bool isLeft = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 32,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFE6F3F4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          isLeft ? Icons.chevron_left : Icons.chevron_right,
          size: 20,
          color: const Color(0xFF2D3748),
        ),
      ),
    );
  }

  Widget _buildMonthlyProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.flag, color: Color(0xFF2D3748)),
              const SizedBox(width: 8),
              const Text(
                'Solved, 3311 questions this month',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2D3748),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '689 away from target',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.83, // 3311 / 4000 = ~83%
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF48BB78)),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final calendarDays = _generateCalendarDays();
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Week day headers (aligned with week number column)
          Row(
            children: [
              const SizedBox(width: 38), // 30 (week number) + 8 (spacing)
              Expanded(
                child: Row(
                  children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                      .map((day) => Expanded(
                            child: Text(
                              day,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Calendar grid
          Column(
            children: List.generate((calendarDays.length / 7).ceil(), (weekIndex) {
              final weekStart = weekIndex * 7;
              final weekDays = calendarDays.sublist(weekStart, math.min(weekStart + 7, calendarDays.length));
              return _buildCalendarWeek(weekDays, weekIndex == 0 ? 'W1' : weekIndex == 1 ? 'W2' : weekIndex == 2 ? 'W3' : weekIndex == 3 ? 'W4' : weekIndex == 4 ? 'W5' : '');
            }),
          ),
        ],
      ),
    );
  }

  List<_CalendarDay> _generateCalendarDays() {
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);

    // Monday-based index (Mon=0..Sun=6)
    final firstWeekday = (firstDayOfMonth.weekday - 1) % 7;

    final previousMonthLastDay = DateTime(_currentMonth.year, _currentMonth.month, 0).day;

    final List<_CalendarDay> days = [];

    // Leading days from previous month
    for (int i = firstWeekday - 1; i >= 0; i--) {
      days.add(_CalendarDay(previousMonthLastDay - i, false));
    }

    // Current month days
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      days.add(_CalendarDay(day, true));
    }

    // Trailing days from next month to complete the last week
    final remainder = days.length % 7;
    if (remainder != 0) {
      final needed = 7 - remainder;
      for (int d = 1; d <= needed; d++) {
        days.add(_CalendarDay(d, false));
      }
    }

    return days;
  }

  Widget _buildCalendarWeek(List<_CalendarDay> days, String weekNumber) {
    return Row(
      children: [
        // Week number
        SizedBox(
          width: 30,
          child: Text(
            weekNumber,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF718096),
            ),
          ),
        ),
        const SizedBox(width: 8),
        
        // Days - properly aligned with day headers
        Expanded(
          child: Row(
            children: days.map((day) {
              return Expanded(
                child: _buildDayButton(day),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDayButton(_CalendarDay calendarDay) {
    final int? day = calendarDay.day;
    final bool isCurrent = calendarDay.isCurrentMonth;
    if (day == null) {
      return const SizedBox(height: 44);
    }

    final dayData = isCurrent ? _calendarData[day] : null;
    final isSelected = isCurrent && day == _selectedDay;
    
    Color backgroundColor;
    Color textColor = Colors.white;
    Widget? icon;
    
    if (dayData != null) {
      switch (dayData['type']) {
        case 'selected':
          backgroundColor = const Color(0xFF48BB78);
          break;
        case 'activity':
          backgroundColor = const Color(0xFF68D391);
          break;
        case 'rest_day':
          backgroundColor = const Color(0xFF9AE6B4);
          icon = const Icon(Icons.beach_access, size: 10, color: Colors.white);
          break;
        case 'sick':
          backgroundColor = const Color(0xFF9AE6B4);
          icon = const Text('🤒', style: TextStyle(fontSize: 10));
          break;
        case 'special':
          backgroundColor = const Color(0xFF48BB78);
          icon = const Icon(Icons.emoji_events, size: 10, color: Colors.amber);
          break;
        default:
          backgroundColor = Colors.grey[300]!;
          textColor = const Color(0xFF2D3748);
      }
    } else {
      backgroundColor = Colors.grey[300]!;
      textColor = const Color(0xFF2D3748);
    }
    
    return GestureDetector(
      onTap: () {
        if (isCurrent) {
          setState(() {
            _selectedDay = day;
          });
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double size = 44.0; // fixed square to ensure perfect circle
          return Center(
            child: Container(
              width: size,
              height: size,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: isCurrent ? backgroundColor : Colors.grey[300]!.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isCurrent ? textColor : const Color(0xFF718096),
                    ),
                  ),
                  if (isCurrent && icon != null) ...[
                    const SizedBox(height: 1),
                    icon,
                    const Text('>>', style: TextStyle(fontSize: 6, color: Colors.white)),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLegendItem('🤒', 'Sickness'),
          _buildLegendItem('🌴', 'Rest Day'),
          _buildLegendItem('>>', 'Streak is saved'),
          _buildLegendItem('👑', 'Question amount'),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String icon, String label) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 8,
            color: Color(0xFF718096),
          ),
        ),
      ],
    );
  }

  Widget _buildDailySummary() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFBEE3F8).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_selectedDay ${_getMonthAbbreviation()} 2025 ${_getDayOfWeek()}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const Text(
                '2 Sessions',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF718096),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Navigation and tabs
          Row(
            children: [
              const Text(
                '< Total >',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2D3748),
                ),
              ),
              const Spacer(),
              Row(
                children: List.generate(3, (index) => Container(
                  width: 4,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6AD55),
                    shape: BoxShape.circle,
                  ),
                )),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Subject tabs and stats
          Row(
            children: [
              // Subject tabs
              Expanded(
                flex: 1,
                child: Column(
                  children: _subjects.asMap().entries.map((entry) {
                    final index = entry.key;
                    final subject = entry.value;
                    final isSelected = index == _selectedSubjectIndex;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSubjectIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFF6AD55) : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          subject,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : const Color(0xFF2D3748),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Statistics
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatRow(Icons.access_time, '01:22:54'),
                    _buildStatRow(Icons.quiz, 'Solved 120'),
                    _buildStatRow(Icons.check_circle, 'Correct 90'),
                    _buildStatRow(Icons.cancel, 'Wrong 20'),
                    _buildStatRow(Icons.radio_button_unchecked, 'Empty 10'),
                    _buildStatRow(Icons.trending_up, 'Net 80'),
                    _buildStatRow(Icons.analytics, 'Accuracy 75%'),
                  ],
                ),
              ),
              
              // Pie chart placeholder
              const SizedBox(width: 12),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8),
                ),
                child: const Center(
                  child: Text(
                    'Pie\nChart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF718096),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(icon, size: 12, color: const Color(0xFF718096)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningPopup() {
    return Positioned(
      bottom: 100,
      right: 16,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showWarningPopup = !_showWarningPopup;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _showWarningPopup ? 200 : 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFED8936),
            borderRadius: BorderRadius.circular(30),
          ),
          child: _showWarningPopup
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Neglected subjects: Math, Physics',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : const Icon(
                  Icons.warning,
                  color: Colors.white,
                  size: 24,
                ),
        ),
      ),
    );
  }

  String _getMonthYearString() {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[_currentMonth.month - 1]} ${_currentMonth.year}';
  }

  String _getMonthAbbreviation() {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[_currentMonth.month - 1];
  }

  String _getDayOfWeek() {
    final selectedDate = DateTime(_currentMonth.year, _currentMonth.month, _selectedDay);
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[selectedDate.weekday - 1];
  }
}
