import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedTabIndex = 1; // Start with "Completed" selected as shown in the image
  String _selectedFilter = 'By Subj';
  bool _showAddBookModal = false;

  // Text controllers for the modal
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _topicsController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();

  final List<String> _tabs = ['All', 'Completed', 'Wishlist', 'Favorites'];
  final List<String> _filters = ['By Subj', 'By Last Solved', 'By Completion Percentage', 'By alphabetic'];

  final Map<String, List<Map<String, dynamic>>> _subjects = {
    'Turkish': [
      {'name': 'ABC Turkish', 'completion': '74.3%'},
      {'name': 'KLM Turkish', 'completion': '22%'},
    ],
    'History': [
      {'name': 'World History', 'completion': '45.8%'},
      {'name': 'Turkish History', 'completion': '67.2%'},
    ],
    'Geography': [
      {'name': 'Physical Geography', 'completion': '38.9%'},
    ],
    'Philosophy': [
      {'name': 'Introduction to Philosophy', 'completion': '15.6%'},
    ],
    'Religion': [
      {'name': 'Comparative Religion', 'completion': '82.1%'},
    ],
    'Math': [
      {'name': 'Advanced Calculus', 'completion': '91.3%'},
      {'name': 'Linear Algebra', 'completion': '56.7%'},
    ],
    'Physics': [
      {'name': 'Quantum Physics', 'completion': '28.4%'},
    ],
    'Biology': [
      {'name': 'Cell Biology', 'completion': '73.5%'},
      {'name': 'Genetics', 'completion': '41.2%'},
    ],
    'Chemistry': [
      {'name': 'Organic Chemistry', 'completion': '59.8%'},
    ],
  };

  final List<Map<String, String>> _lastSolvedBooks = [
    {'name': 'ABC Turkish', 'subject': 'Turkish'},
    {'name': 'XYZ Math', 'subject': 'Math'},
    {'name': 'XYZ Bio', 'subject': 'Biology'},
  ];

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
              Column(
                children: [
                  // Library Header
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text(
                          'Library',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Tab Navigation
                  _buildTabNavigation(),
                  
                  // Last Solved Section
                  _buildLastSolvedSection(),
                  
                  // Add New Book Button
                  _buildAddNewBookButton(),
                  
                  // Book Glossary
                  Expanded(
                    child: _buildBookGlossary(),
                  ),
                ],
              ),
              
              // Add Book Modal
              if (_showAddBookModal) _buildAddBookModal(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: _tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              final isSelected = index == _selectedTabIndex;
              
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTabIndex = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          tab,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected 
                                ? const Color(0xFF2D3748) 
                                : const Color(0xFFA0AEC0),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: isSelected ? 3 : 1,
                          decoration: BoxDecoration(
                            color: isSelected 
                                ? const Color(0xFFF6AD55) 
                                : const Color(0xFFF6AD55).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          height: 1,
          color: const Color(0xFFF6AD55).withOpacity(0.3),
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }

  Widget _buildLastSolvedSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFBEE3F8).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last Solved',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF718096),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: _lastSolvedBooks.map((book) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7FAFC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.book,
                        color: Color(0xFFCBD5E0),
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book['name']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2D3748),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewBookButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _showAddBookModal = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFF6AD55), Color(0xFFED8936)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: const Text(
              'Add New Book',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookGlossary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFBEE3F8).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Filter header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D3748),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedFilter,
                    dropdownColor: const Color(0xFF2D3748),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 12),
                    items: _filters.map((filter) {
                      return DropdownMenuItem<String>(
                        value: filter,
                        child: Text(filter),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedFilter = value!);
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // Subjects list
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                // Reduce scroll speed by adjusting physics
                return false;
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  final subjectEntry = _subjects.entries.elementAt(index);
                  final subjectName = subjectEntry.key;
                  final books = subjectEntry.value;
                  
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Subject header
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                subjectName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D3748),
                                ),
                              ),
                              Icon(
                                subjectName == 'Turkish' ? Icons.edit : Icons.settings,
                                color: const Color(0xFF718096),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        
                        // Separator line
                        Container(
                          height: 1,
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        
                        // Books
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: books.map((book) {
                              return Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF7FAFC),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.book,
                                        color: Color(0xFFCBD5E0),
                                        size: 40,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      book['name']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF2D3748),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      book['completion']!,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF718096),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddBookModal() {
    return Container(
      color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF5F9EA0), // Teal background
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with back arrow
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showAddBookModal = false;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Modal content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Publisher section
                    const Text(
                      'PUBLISHER',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(_publisherController, 'Enter publisher'),
                    
                    const SizedBox(height: 20),
                    
                    // Subject section
                    const Text(
                      'SUBJECT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(_subjectController, 'Enter subject'),
                    
                    const SizedBox(height: 20),
                    
                    // Topics section
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0E68C),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'TOPICS',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0E68C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Select topics',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF2D3748),
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF2D3748),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Year section
                    const Text(
                      'YEAR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildInputField(_yearController, 'Enter year'),
                    
                    const SizedBox(height: 20),
                    
                    // Page and Question section
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PAGE',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D3748),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildSmallInputField(_pageController, 'Page'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'QUESTION',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D3748),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildSmallInputField(_questionController, 'Question'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Add button
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Handle add book functionality
                          setState(() {
                            _showAddBookModal = false;
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0E68C),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0E68C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF2D3748),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFF718096),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSmallInputField(TextEditingController controller, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0E68C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF2D3748),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFF718096),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _publisherController.dispose();
    _subjectController.dispose();
    _topicsController.dispose();
    _yearController.dispose();
    _pageController.dispose();
    _questionController.dispose();
    super.dispose();
  }
}
