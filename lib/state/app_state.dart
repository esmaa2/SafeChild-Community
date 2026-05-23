class AppState {
  static bool parentProfileCompleted = false;

  static String fullName = '';
  static String username = '';
  static String email = '';
  static String phone = '';
  static String birthdate = '';
  static String city = '';
  static String profileImagePath = '';

  static int childrenCount = 0;

  static List<ChildProfile> children = [];

  static bool notificationsEnabled = true;
  static bool weeklyReportsEnabled = true;
  static bool emergencyAlertsOnly = false;
  static String preferredLanguage = 'English';
}

class ChildProfile {
  String fullName;
  String age;
  String grade;
  String school;
  String language;
  String city;
  String phone;
  String deviceType;
  String dailyScreenLimit;
  String safetyLevel;

  bool usesDevice;
  bool socialFeedEnabled;
  bool chatEnabled;
  bool searchEnabled;
  bool learningEnabled;
  bool photosVideosEnabled;

  ChildProfile({
    this.fullName = '',
    this.age = '',
    this.grade = '',
    this.school = '',
    this.language = '',
    this.city = '',
    this.phone = '',
    this.deviceType = '',
    this.dailyScreenLimit = '',
    this.safetyLevel = 'Medium',
    this.usesDevice = false,
    this.socialFeedEnabled = false,
    this.chatEnabled = false,
    this.searchEnabled = false,
    this.learningEnabled = true,
    this.photosVideosEnabled = false,
  });
}