import 'package:flutter/material.dart';

class ChildControlPanelScreen extends StatefulWidget {
  final String childName;

  const ChildControlPanelScreen({super.key, required this.childName});

  @override
  State<ChildControlPanelScreen> createState() =>
      _ChildControlPanelScreenState();
}

class _ChildControlPanelScreenState extends State<ChildControlPanelScreen> {
  double screenTime = 120; // بالدقايق (2h)

  bool socialFeed = true;
  bool chat = false;
  bool photos = true;
  bool search = false;
  bool learning = true;
  bool tasks = true;

  static const rose = Color(0xFFDC9B9B);
  static const bg = Color(0xFFFAF7F2);
  static const textDark = Color(0xFF2A2A2A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔙 Back + Title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    widget.childName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              const Text(
                "Manage features & controls",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// 👶 Child Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          widget.childName[0],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Text(
                        "Age 10 • 5th Grade",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Protected",
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 🔘 Top Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _smallCard(Icons.show_chart, "Activity"),
                  _smallCard(Icons.school, "Learning"),
                  _smallCard(Icons.checklist, "Tasks"),
                ],
              ),

              const SizedBox(height: 20),

              /// ⏱ Screen Time
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Screen Time Limit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Daily maximum usage",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),

                    /// Slider
                    Slider(
                      value: screenTime,
                      min: 15,
                      max: 480,
                      onChanged: (value) {
                        setState(() => screenTime = value);
                      },
                      activeColor: rose,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("15 min"),
                        Text("8 hours"),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Feature Controls",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _switchTile("Social Feed", socialFeed, (v) {
                setState(() => socialFeed = v);
              }),

              _switchTile("Chat", chat, (v) {
                setState(() => chat = v);
              }),

              _switchTile("Photos & Videos", photos, (v) {
                setState(() => photos = v);
              }),

              _switchTile("Search", search, (v) {
                setState(() => search = v);
              }),

              _switchTile("Learning Section", learning, (v) {
                setState(() => learning = v);
              }),

              _switchTile("Tasks & Chores", tasks, (v) {
                setState(() => tasks = v);
              }),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Small Cards
  Widget _smallCard(IconData icon, String title) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: rose),
          const SizedBox(height: 6),
          Text(title),
        ],
      ),
    );
  }

  /// 🔹 Switch Item
  Widget _switchTile(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: rose,
          )
        ],
      ),
    );
  }
}