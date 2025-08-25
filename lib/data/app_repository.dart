import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tetsugym/core/constants/db_names.dart';

class AppRepository {
  final FirebaseFirestore _firestore;

  AppRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Obtiene los datos de un usuario por su UID
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    final doc = await _firestore
        .collection(FirestoreTables.owners)
        .doc(uid)
        .get();
    return doc.data();
  }

  /// Actualiza los datos de un usuario por su UID
  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection(FirestoreTables.owners).doc(uid).update(data);
  }

  /// Crear un usuario nuevo en Firestore
  Future<void> createUser(String uid, Map<String, dynamic> data) async {
    await _firestore.collection(FirestoreTables.owners).doc(uid).set(data);
  }

  /// Escuchar cambios en tiempo real de un usuario
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUserData(String uid) {
    return _firestore.collection(FirestoreTables.owners).doc(uid).snapshots();
  }
}
