import 'package:flutter/material.dart';

class EditChildScreen extends StatefulWidget {
  final String childName;

  const EditChildScreen({
    super.key,
    required this.childName,
  });

  @override
  State<EditChildScreen> createState() => _EditChildScreenState();
}

class _EditChildScreenState extends State<EditChildScreen> {
  late final TextEditingController nameController;
  final TextEditingController ageController = TextEditingController(text: '10');
  final TextEditingController gradeController =
      TextEditingController(text: '5th Grade');

  String gender = 'Female';

  static const background = Color(0xFFFAF7F2);
  static const rose = Color(0xFFDC9B9B);
  static const roseLight = Color(0xFFF8E6E6);
  static const textDark = Color(0xFF2A2A2A);
  static const textMuted = Color(0xFF7A6F73);
  static const border = Color(0xFFE4DAD6);

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.childName);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  void _saveChild() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Child profile updated')),
    );
    Navigator.pop(context);
  }

  void _deleteChild() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete child profile?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Color(0xFFE05252)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 22),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: border)),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: _saveChild,
              style: ElevatedButton.styleFrom(
                backgroundColor: rose,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 24, 18, 24),
                children: [
                  _photoPicker(),
                  const SizedBox(height: 34),
                  _label("Child's Name *"),
                  const SizedBox(height: 8),
                  _textField(nameController),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _label('Age'),
                            const SizedBox(height: 8),
                            _textField(ageController,
                                keyboardType: TextInputType.number),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _label('Gender'),
                            const SizedBox(height: 8),
                            _genderDropdown(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _label('Grade / Class'),
                  const SizedBox(height: 8),
                  _textField(gradeController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 82,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: border)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: textDark,
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: textDark,
              ),
            ),
          ),
          IconButton(
            onPressed: _deleteChild,
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFE05252),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoPicker() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 128,
            width: 128,
            decoration: BoxDecoration(
              color: const Color(0xFFF1EEE9),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE4DAD6),
                width: 2,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera_alt_outlined,
                  color: textMuted,
                  size: 32,
                ),
                SizedBox(height: 8),
                Text(
                  'Photo',
                  style: TextStyle(
                    color: textMuted,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -2,
            bottom: 8,
            child: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: rose,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: rose.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.white,
                size: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: textDark,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _textField(
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontSize: 20,
          color: textDark,
          fontWeight: FontWeight.w600,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        ),
      ),
    );
  }

  Widget _genderDropdown() {
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: gender,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: textMuted,
          ),
          style: const TextStyle(
            fontSize: 20,
            color: textDark,
            fontWeight: FontWeight.w600,
          ),
          items: const [
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Male', child: Text('Male')),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() => gender = value);
            }
          },
        ),
      ),
    );
  }
}