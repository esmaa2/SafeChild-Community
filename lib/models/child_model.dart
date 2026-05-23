class ChildModel {
  final String id;
  final String fullName;
  final String age;
  final String grade;
  final String school;
  final String language;
  final String city;
  final String phone;
  final String deviceType;
  final String dailyScreenLimit;
  final String safetyLevel;

  final bool usesDevice;
  final bool socialFeedEnabled;
  final bool chatEnabled;
  final bool searchEnabled;
  final bool learningEnabled;
  final bool photosVideosEnabled;

  ChildModel({
    required this.id,
    required this.fullName,
    required this.age,
    required this.grade,
    required this.school,
    required this.language,
    required this.city,
    required this.phone,
    required this.deviceType,
    required this.dailyScreenLimit,
    required this.safetyLevel,
    required this.usesDevice,
    required this.socialFeedEnabled,
    required this.chatEnabled,
    required this.searchEnabled,
    required this.learningEnabled,
    required this.photosVideosEnabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'age': age,
      'grade': grade,
      'school': school,
      'language': language,
      'city': city,
      'phone': phone,
      'deviceType': deviceType,
      'dailyScreenLimit': dailyScreenLimit,
      'safetyLevel': safetyLevel,
      'usesDevice': usesDevice,
      'socialFeedEnabled': socialFeedEnabled,
      'chatEnabled': chatEnabled,
      'searchEnabled': searchEnabled,
      'learningEnabled': learningEnabled,
      'photosVideosEnabled': photosVideosEnabled,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      age: map['age'] ?? '',
      grade: map['grade'] ?? '',
      school: map['school'] ?? '',
      language: map['language'] ?? '',
      city: map['city'] ?? '',
      phone: map['phone'] ?? '',
      deviceType: map['deviceType'] ?? '',
      dailyScreenLimit: map['dailyScreenLimit'] ?? '',
      safetyLevel: map['safetyLevel'] ?? 'Medium',
      usesDevice: map['usesDevice'] ?? false,
      socialFeedEnabled: map['socialFeedEnabled'] ?? false,
      chatEnabled: map['chatEnabled'] ?? false,
      searchEnabled: map['searchEnabled'] ?? false,
      learningEnabled: map['learningEnabled'] ?? true,
      photosVideosEnabled: map['photosVideosEnabled'] ?? false,
    );
  }
}