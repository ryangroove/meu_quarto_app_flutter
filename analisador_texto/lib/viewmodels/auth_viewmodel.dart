import 'package:flutter/material.dart';
import '../../data/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel(this._authService);

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final user = await _authService.login(email, password);
      return user != null;
    } catch (e) {
      errorMessage = _formatError(e);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup(String email, String password) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final user = await _authService.register(email, password);
      return user != null;
    } catch (e) {
      errorMessage = _formatError(e);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email) async {
    await _authService.resetPassword(email);
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  String _formatError(Object e) {
    return e.toString().replaceAll("FirebaseAuthException", "");
  }
}
