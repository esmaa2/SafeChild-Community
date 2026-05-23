import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safechild/models/parent_model.dart';
import 'package:safechild/models/child_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveParentProfile(ParentModel parent) async {
    await _firestore.collection('parents').doc(parent.uid).set(
          parent.toMap(),
          SetOptions(merge: true),
        );
  }

  Future<void> saveChildren({
    required String parentId,
    required List<ChildModel> children,
  }) async {
    final batch = _firestore.batch();

    for (final child in children) {
      final childRef = _firestore.collection('children').doc(child.id);

      batch.set(
        childRef,
        {
          ...child.toMap(),
          'parentId': parentId,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    }

    await batch.commit();
  }

  Future<Map<String, dynamic>?> getParentProfile(String uid) async {
    final doc = await _firestore.collection('parents').doc(uid).get();
    return doc.data();
  }

  Future<List<Map<String, dynamic>>> getChildren(String parentId) async {
    final snapshot = await _firestore
        .collection('children')
        .where('parentId', isEqualTo: parentId)
        .get();

    return snapshot.docs.map((doc) {
      return {
        'docId': doc.id,
        ...doc.data(),
      };
    }).toList();
  }

  Stream<List<Map<String, dynamic>>> childrenStream(String parentId) {
    return _firestore
        .collection('children')
        .where('parentId', isEqualTo: parentId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'docId': doc.id,
          ...doc.data(),
        };
      }).toList();
    });
  }
}