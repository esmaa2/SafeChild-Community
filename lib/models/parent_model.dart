class ParentModel {
  final String uid;
  final String fullName;
  final String username;
  final String email;
  final String phone;
  final String birthdate;
  final String city;
  final String profileImagePath;
  final bool parentProfileCompleted;
  final int childrenCount;
  final bool notificationsEnabled;
  final bool weeklyReportsEnabled;
  final bool emergencyAlertsOnly;
  final String preferredLanguage;

  ParentModel({
    required this.uid,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.city,
    required this.profileImagePath,
    required this.parentProfileCompleted,
    required this.childrenCount,
    required this.notificationsEnabled,
    required this.weeklyReportsEnabled,
    required this.emergencyAlertsOnly,
    required this.preferredLanguage,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'username': username,
      'email': email,
      'phone': phone,
      'birthdate': birthdate,
      'city': city,
      'profileImagePath': profileImagePath,
      'parentProfileCompleted': parentProfileCompleted,
      'childrenCount': childrenCount,
      'notificationsEnabled': notificationsEnabled,
      'weeklyReportsEnabled': weeklyReportsEnabled,
      'emergencyAlertsOnly': emergencyAlertsOnly,
      'preferredLanguage': preferredLanguage,
    };
  }

  factory ParentModel.fromMap(Map<String, dynamic> map) {
    return ParentModel(
      uid: map['uid'] ?? '',
      fullName: map['fullName'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      birthdate: map['birthdate'] ?? '',
      city: map['city'] ?? '',
      profileImagePath: map['profileImagePath'] ?? '',
      parentProfileCompleted: map['parentProfileCompleted'] ?? false,
      childrenCount: map['childrenCount'] ?? 0,
      notificationsEnabled: map['notificationsEnabled'] ?? true,
      weeklyReportsEnabled: map['weeklyReportsEnabled'] ?? true,
      emergencyAlertsOnly: map['emergencyAlertsOnly'] ?? false,
      preferredLanguage: map['preferredLanguage'] ?? 'English',
    );
  }
}