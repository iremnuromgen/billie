// import 'package:firebase_auth/firebase_auth.dart';
// import '../viewmodel/google_auth_service.dart';

// class AuthViewModel {
//   final GoogleAuthService _googleAuthService = GoogleAuthService();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<User?> get userChanges => _auth.userChanges();

//   Future<UserCredential?> signInWithGoogle() async {
//     return await _googleAuthService.signInWithGoogle();
//   }

//   Future<void> signOut() async {
//     await _googleAuthService.signOut();
//   }
// }