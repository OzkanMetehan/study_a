import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _tabIndex = 0; // 0 Badges, 1 Preferences, 2 Settings

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
            child: Column(
              children: [
                const SizedBox(height: 16),
                _header(),
                const SizedBox(height: 12),
                _statsCard(),
                const SizedBox(height: 12),
                _centerEditButtonRow(),
                const SizedBox(height: 16),
                _tabs(
                  selectedIndex: _tabIndex,
                  onSelect: (i) => setState(() => _tabIndex = i),
                  onSeeAll: () {},
                ),
                const SizedBox(height: 12),
                if (_tabIndex == 0) _badgesGrid() else _placeholderSection(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _header() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        // Avatar
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFFFF4E5), Color(0xFFFBE7F0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Name & meta card
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: const [
              Text('[NAME]', style: TextStyle(fontWeight: FontWeight.w700)),
              SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('[Grade]'),
                  SizedBox(width: 12),
                  Text('|'),
                  SizedBox(width: 12),
                  Text('[Nick]'),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _statsCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _stat('3425', 'Questions'),
          _stat('59 h 27 m', 'Hours'),
          _stat('38', 'Sessions'),
        ],
      ),
    ),
  );
}

Widget _stat(String value, String label) {
  return Column(
    children: [
      Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
      const SizedBox(height: 6),
      Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF718096))),
    ],
  );
}

Widget _centerEditButtonRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF6AD55),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Edit Profile Info'),
                SizedBox(width: 6),
                Icon(Icons.edit, size: 16),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _tabs({required int selectedIndex, required ValueChanged<int> onSelect, required VoidCallback onSeeAll}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        Row(
          children: [
            _tab('Badges', selected: selectedIndex == 0, onTap: () => onSelect(0)),
            const SizedBox(width: 16),
            _tab('Preferences', selected: selectedIndex == 1, onTap: () => onSelect(1)),
            const SizedBox(width: 16),
            _tab('Settings', selected: selectedIndex == 2, onTap: () => onSelect(2)),
            const Spacer(),
            if (selectedIndex == 0)
              TextButton(
                onPressed: onSeeAll,
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: const Text('See all', style: TextStyle(fontSize: 12, color: Color(0xFF718096))),
              ),
            const SizedBox(width: 8),
            Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(colors: [
                  Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple, Colors.red
                ]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Thin stick-bar indicator
        Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(left: selectedIndex == 0 ? 0 : selectedIndex == 1 ? 76 : 76 + 98),
              // rough offset based on label widths; good enough for placeholder
              width: 52,
              height: 2,
              color: const Color(0xFF2D3748),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _tab(String label, {bool selected = false, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: selected ? const Color(0xFF2D3748) : const Color(0xFF718096),
        ),
      ),
    ),
  );
}

Widget _badgesGrid() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, i) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF6AD55), width: 2),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _placeholderSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text('Coming soon...', style: TextStyle(color: Color(0xFF718096))),
    ),
  );
}
