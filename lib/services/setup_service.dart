import 'package:safechild/models/child_model.dart';
import 'package:safechild/models/parent_model.dart';
import 'package:safechild/services/database_service.dart';

class SetupService {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> completeSetup({
    required String userId,
    required String email,
    required String fullName,
    required String username,
    required String phone,
    required String birthdate,
    required String city,
    required String profileImagePath,
    required bool notificationsEnabled,
    required bool weeklyReportsEnabled,
    required bool emergencyAlertsOnly,
    required String preferredLanguage,
    required List<ChildModel> children,
  }) async {
    final parent = ParentModel(
      uid: userId,
      fullName: fullName,
      username: username,
      email: email,
      phone: phone,
      birthdate: birthdate,
      city: city,
      profileImagePath: profileImagePath,
      parentProfileCompleted: true,
      childrenCount: children.length,
      notificationsEnabled: notificationsEnabled,
      weeklyReportsEnabled: weeklyReportsEnabled,
      emergencyAlertsOnly: emergencyAlertsOnly,
      preferredLanguage: preferredLanguage,
    );

    await _databaseService.saveParentProfile(parent);

    await _databaseService.saveChildren(
      parentId: userId,
      children: children,
    );
  }
}