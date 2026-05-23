import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safechild/state/app_state.dart';
import 'package:safechild/services/setup_service.dart';
import 'package:safechild/models/child_model.dart';
import 'package:safechild/screens/parent/parent_main_shell.dart';

class CompleteProfileSetupScreen extends StatefulWidget {
  const CompleteProfileSetupScreen({super.key});

  @override
  State<CompleteProfileSetupScreen> createState() =>
      _CompleteProfileSetupScreenState();
}

class _CompleteProfileSetupScreenState
    extends State<CompleteProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  int currentStep = 0;
  bool isSaving = false;

  final TextEditingController fullNameController =
      TextEditingController(text: AppState.fullName);
  final TextEditingController usernameController =
      TextEditingController(text: AppState.username);
  final TextEditingController phoneController =
      TextEditingController(text: AppState.phone);
  final TextEditingController birthdateController =
      TextEditingController(text: AppState.birthdate);
  final TextEditingController cityController =
      TextEditingController(text: AppState.city);

  bool notificationsEnabled = AppState.notificationsEnabled;
  bool weeklyReportsEnabled = AppState.weeklyReportsEnabled;
  bool emergencyAlertsOnly = AppState.emergencyAlertsOnly;
  String preferredLanguage = AppState.preferredLanguage;

  List<ChildProfile> children = List.from(AppState.children);

  static const background = Color(0xFFFAF7F2);
  static const primary = Color(0xFF5FA8A7);
  static const rose = Color(0xFFDC9B9B);
  static const roseLight = Color(0xFFF8E6E6);
  static const textDark = Color(0xFF2A2A2A);
  static const textMuted = Color(0xFF7A6F73);
  static const border = Color(0xFFE4DAD6);

  @override
  void initState() {
    super.initState();
    if (children.isEmpty) {
      children.add(ChildProfile());
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    birthdateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  Future<void> _nextStep() async {
    if (currentStep == 0 && !_formKey.currentState!.validate()) return;

    if (currentStep < 2) {
      setState(() => currentStep++);
    } else {
      await _saveProfile();
    }
  }

  void _previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  void _addChild() {
    setState(() => children.add(ChildProfile()));
  }

  void _removeChild(int index) {
    if (children.length == 1) return;
    setState(() => children.removeAt(index));
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final bool hasValidChild =
        children.any((child) => child.fullName.trim().isNotEmpty);

    if (!hasValidChild) {
      _showMessage('Please add at least one child name.');
      return;
    }

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      _showMessage('No logged-in user found. Please login again.');
      return;
    }

    try {
      setState(() => isSaving = true);

      final setupService = SetupService();

      final List<ChildModel> childModels = children.map((child) {
        return ChildModel(
          id: '${DateTime.now().microsecondsSinceEpoch}_${child.fullName.hashCode}',
          fullName: child.fullName.trim(),
          age: child.age.trim(),
          grade: child.grade.trim(),
          school: child.school.trim(),
          language: child.language.trim(),
          city: child.city.trim(),
          phone: child.phone.trim(),
          deviceType: child.deviceType.trim(),
          dailyScreenLimit: child.dailyScreenLimit.trim(),
          safetyLevel: child.safetyLevel.trim().isEmpty
              ? 'Medium'
              : child.safetyLevel.trim(),
          usesDevice: child.usesDevice,
          socialFeedEnabled: child.socialFeedEnabled,
          chatEnabled: child.chatEnabled,
          searchEnabled: child.searchEnabled,
          learningEnabled: child.learningEnabled,
          photosVideosEnabled: child.photosVideosEnabled,
        );
      }).toList();

      await setupService.completeSetup(
        userId: user.uid,
        email: user.email ?? '',
        fullName: fullNameController.text.trim(),
        username: usernameController.text.trim(),
        phone: phoneController.text.trim(),
        birthdate: birthdateController.text.trim(),
        city: cityController.text.trim(),
        profileImagePath: '',
        notificationsEnabled: notificationsEnabled,
        weeklyReportsEnabled: weeklyReportsEnabled,
        emergencyAlertsOnly: emergencyAlertsOnly,
        preferredLanguage: preferredLanguage,
        children: childModels,
      );

      AppState.fullName = fullNameController.text.trim();
      AppState.username = usernameController.text.trim();
      AppState.email = user.email ?? '';
      AppState.phone = phoneController.text.trim();
      AppState.birthdate = birthdateController.text.trim();
      AppState.city = cityController.text.trim();
      AppState.notificationsEnabled = notificationsEnabled;
      AppState.weeklyReportsEnabled = weeklyReportsEnabled;
      AppState.emergencyAlertsOnly = emergencyAlertsOnly;
      AppState.preferredLanguage = preferredLanguage;
      AppState.children = children;
      AppState.childrenCount = children.length;
      AppState.parentProfileCompleted = true;

      if (!mounted) return;

      _showMessage('Profile setup completed successfully.');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const ParentMainShell()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      _showMessage('Setup failed: $e');
    } finally {
      if (mounted) setState(() => isSaving = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  double get progressValue => (currentStep + 1) / 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 120),
                  children: [
                    if (currentStep == 0) _buildParentInfoStep(),
                    if (currentStep == 1) _buildChildrenStep(),
                    if (currentStep == 2) _buildPreferencesStep(),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: border)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _circleIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: _previousStep,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Complete Profile Setup',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: textDark,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                decoration: BoxDecoration(
                  color: roseLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${currentStep + 1} of 3',
                  style: const TextStyle(
                    color: rose,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 7,
              backgroundColor: const Color(0xFFE9E2DF),
              valueColor: const AlwaysStoppedAnimation<Color>(rose),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentInfoStep() {
    final user = FirebaseAuth.instance.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepTitle(
          title: 'Parent Information',
          subtitle:
              'Complete the parent profile. Child profiles will be stored separately and linked to this account.',
        ),
        const SizedBox(height: 16),
        _buildCard(
          child: Column(
            children: [
              _buildReadOnlyInfoField(
                label: 'Account Email',
                value: user?.email ?? 'No email found',
              ),
              _buildTextField(
                controller: fullNameController,
                label: 'Full Name *',
                hint: 'Enter your full name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Full name is required';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: usernameController,
                label: 'Username *',
                hint: 'Choose a username',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: phoneController,
                label: 'Phone',
                hint: 'Optional phone number',
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                controller: birthdateController,
                label: 'Birthdate',
                hint: 'Optional',
              ),
              _buildTextField(
                controller: cityController,
                label: 'City',
                hint: 'Enter your city',
              ),
              _buildDropdownField(
                label: 'Preferred Language',
                value: preferredLanguage,
                items: const ['English', 'Arabic', 'Turkish'],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => preferredLanguage = value);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChildrenStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepTitle(
          title: 'Children Profiles',
          subtitle:
              'Add child profiles separately. Each child will be linked to your parent account.',
        ),
        const SizedBox(height: 16),
        ...List.generate(
          children.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _buildChildCard(index),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton.icon(
            onPressed: _addChild,
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add Another Child'),
            style: OutlinedButton.styleFrom(
              foregroundColor: rose,
              side: const BorderSide(color: rose),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChildCard(int index) {
    final child = children[index];

    final nameController = TextEditingController(text: child.fullName);
    final ageController = TextEditingController(text: child.age);
    final gradeController = TextEditingController(text: child.grade);
    final schoolController = TextEditingController(text: child.school);
    final languageController = TextEditingController(text: child.language);
    final cityController = TextEditingController(text: child.city);
    final phoneController = TextEditingController(text: child.phone);
    final deviceTypeController = TextEditingController(text: child.deviceType);
    final dailyLimitController =
        TextEditingController(text: child.dailyScreenLimit);

    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: roseLight,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: rose,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Child ${index + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),
              const Spacer(),
              if (children.length > 1)
                IconButton(
                  onPressed: () => _removeChild(index),
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Color(0xFFE05252),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: nameController,
            label: 'Child Full Name *',
            hint: 'Enter child name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Child name is required';
              }
              return null;
            },
            onChanged: (value) => child.fullName = value,
          ),
          _buildTextField(
            controller: ageController,
            label: 'Age *',
            hint: 'Enter age',
            keyboardType: TextInputType.number,
            onChanged: (value) => child.age = value,
          ),
          _buildTextField(
            controller: gradeController,
            label: 'Grade / School Year',
            hint: 'Example: 5th Grade',
            onChanged: (value) => child.grade = value,
          ),
          _buildTextField(
            controller: schoolController,
            label: 'School',
            hint: 'Optional school name',
            onChanged: (value) => child.school = value,
          ),
          _buildTextField(
            controller: languageController,
            label: 'Language',
            hint: 'Language spoken by the child',
            onChanged: (value) => child.language = value,
          ),
          _buildTextField(
            controller: cityController,
            label: 'City',
            hint: 'Child city',
            onChanged: (value) => child.city = value,
          ),
          _buildTextField(
            controller: phoneController,
            label: 'Phone Number',
            hint: 'Optional child phone',
            keyboardType: TextInputType.phone,
            onChanged: (value) => child.phone = value,
          ),
          _buildSwitchTile(
            value: child.usesDevice,
            title: 'Uses a device',
            subtitle: 'Phone / tablet / shared device',
            onChanged: (value) => setState(() => child.usesDevice = value),
          ),
          if (child.usesDevice) ...[
            _buildTextField(
              controller: deviceTypeController,
              label: 'Device Type',
              hint: 'Phone / Tablet / Shared device',
              onChanged: (value) => child.deviceType = value,
            ),
            _buildTextField(
              controller: dailyLimitController,
              label: 'Daily Screen Limit',
              hint: 'Example: 2 hours',
              onChanged: (value) => child.dailyScreenLimit = value,
            ),
          ],
          _buildDropdownField(
            label: 'Safety Level',
            value: child.safetyLevel,
            items: const ['Low', 'Medium', 'Strict'],
            onChanged: (value) {
              if (value != null) {
                setState(() => child.safetyLevel = value);
              }
            },
          ),
          const SizedBox(height: 8),
          const Text(
            'Allowed Features',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: textDark,
            ),
          ),
          const SizedBox(height: 8),
          _buildFeatureCheckbox(
            title: 'Social Feed',
            value: child.socialFeedEnabled,
            onChanged: (value) {
              setState(() => child.socialFeedEnabled = value ?? false);
            },
          ),
          _buildFeatureCheckbox(
            title: 'Chat',
            value: child.chatEnabled,
            onChanged: (value) {
              setState(() => child.chatEnabled = value ?? false);
            },
          ),
          _buildFeatureCheckbox(
            title: 'Search',
            value: child.searchEnabled,
            onChanged: (value) {
              setState(() => child.searchEnabled = value ?? false);
            },
          ),
          _buildFeatureCheckbox(
            title: 'Learning',
            value: child.learningEnabled,
            onChanged: (value) {
              setState(() => child.learningEnabled = value ?? false);
            },
          ),
          _buildFeatureCheckbox(
            title: 'Photos / Videos',
            value: child.photosVideosEnabled,
            onChanged: (value) {
              setState(() => child.photosVideosEnabled = value ?? false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesStep() {
    final user = FirebaseAuth.instance.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepTitle(
          title: 'Preferences & Alerts',
          subtitle:
              'Choose how you want to receive safety alerts and reports.',
        ),
        const SizedBox(height: 16),
        _buildCard(
          child: Column(
            children: [
              _buildSwitchTile(
                value: notificationsEnabled,
                title: 'Enable Notifications',
                subtitle: 'Receive important family alerts',
                onChanged: (value) {
                  setState(() => notificationsEnabled = value);
                },
              ),
              const Divider(color: border),
              _buildSwitchTile(
                value: weeklyReportsEnabled,
                title: 'Weekly Reports',
                subtitle: 'Get a weekly family activity summary',
                onChanged: (value) {
                  setState(() => weeklyReportsEnabled = value);
                },
              ),
              const Divider(color: border),
              _buildSwitchTile(
                value: emergencyAlertsOnly,
                title: 'Emergency Alerts Only',
                subtitle: 'Only notify for urgent safety cases',
                onChanged: (value) {
                  setState(() => emergencyAlertsOnly = value);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Summary',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),
              const SizedBox(height: 12),
              _summaryRow('Parent Name', fullNameController.text),
              _summaryRow('Username', usernameController.text),
              _summaryRow('Email', user?.email ?? ''),
              _summaryRow('City', cityController.text),
              _summaryRow('Children Count', '${children.length}'),
              _summaryRow('Language', preferredLanguage),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: isSaving ? null : _previousStep,
              style: OutlinedButton.styleFrom(
                foregroundColor: textMuted,
                side: const BorderSide(color: border),
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(currentStep == 0 ? 'Back' : 'Previous'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: isSaving ? null : _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: rose,
                foregroundColor: Colors.white,
                disabledBackgroundColor: rose.withOpacity(0.55),
                minimumSize: const Size.fromHeight(52),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: isSaving
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.2,
                        color: Colors.white,
                      ),
                    )
                  : Text(currentStep == 2 ? 'Finish Setup' : 'Continue'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepTitle({
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: textMuted,
            height: 1.45,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: border),
      ),
      child: child,
    );
  }

  Widget _buildReadOnlyInfoField({
    required String label,
    required String value,
  }) {
    return _fieldWrapper(
      label: label,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F3EF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
        ),
        child: Text(
          value.isEmpty ? '-' : value,
          style: const TextStyle(
            color: textDark,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return _fieldWrapper(
      label: label,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF7F3EF),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: rose, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    final safeValue = items.contains(value) ? value : items.first;

    return _fieldWrapper(
      label: label,
      child: DropdownButtonFormField<String>(
        value: safeValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF7F3EF),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: border),
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _fieldWrapper({
    required String label,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: textMuted,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 7),
          child,
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required bool value,
    required String title,
    required String subtitle,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      activeColor: rose,
      title: Text(
        title,
        style: const TextStyle(
          color: textDark,
          fontWeight: FontWeight.w800,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: textMuted,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildFeatureCheckbox({
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      activeColor: rose,
      title: Text(
        title,
        style: const TextStyle(
          color: textDark,
          fontWeight: FontWeight.w600,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: textMuted,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '-' : value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: textDark,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: roseLight,
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: rose, size: 20),
      ),
    );
  }
}