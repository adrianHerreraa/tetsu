import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/app_repository.dart';

class AppService {
  final AppRepository _repository;

  AppService({AppRepository? repository})
      : _repository = repository ?? AppRepository();

  /// Obtener datos de usuario
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    return await _repository.getUserData(uid);
  }

  /// Actualizar datos de usuario
  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    await _repository.updateUserData(uid, data);
  }

  /// Crear un usuario nuevo
  Future<void> createOwnerUser(String uid, Map<String, dynamic> data) async {
    await _repository.createOwnerUser(uid, data);
  }

  /// Escuchar cambios en tiempo real
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUserData(String uid) {
    return _repository.streamUserData(uid);
  }
}
