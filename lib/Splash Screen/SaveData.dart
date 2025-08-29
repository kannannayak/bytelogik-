import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Async provider to check if the user is logged in
final loginStatusProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final userEmail = prefs.getString("user_email");
  return userEmail != null && userEmail.isNotEmpty;
});
