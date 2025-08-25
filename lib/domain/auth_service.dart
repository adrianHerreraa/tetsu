import 'package:firebase_auth/firebase_auth.dart';

import '../data/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository;

  AuthService({
    AuthRepository? authRepository,
  }) : _authRepository = authRepository ?? AuthRepository();

  Future<User?> login(String email, String password) async {
    // Aquí puedes agregar validaciones o lógica adicional si quieres
    return await _authRepository.loginWithEmailAndPassword(email, password);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }

  User? get currentUser => _authRepository.currentUser;
}
