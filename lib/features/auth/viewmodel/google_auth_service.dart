// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email', 'profile'],
//   );

//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       final GoogleSignInUser? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         print('Kullanıcı Google girişini iptal etti.');
//         return null;
//       }

//       final GoogleSignInTokenData? tokenData = await googleUser.authentication;

//       if (tokenData == null) {
//         print('Google token alınamadı.');
//         return null;
//       }

//       final credential = GoogleAuthProvider.credential(
//         accessToken: tokenData.accessToken,
//         idToken: tokenData.idToken,
//       );

//       final userCredential = await _auth.signInWithCredential(credential);
//       print('Giriş başarılı: ${userCredential.user?.displayName}');
//       return userCredential;
//     } catch (e) {
//       print('Google sign-in error: $e');
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       await _googleSignIn.disconnect();
//       await _auth.signOut();
//       print('Kullanıcı çıkış yaptı.');
//     } catch (e) {
//       print('Çıkış hatası: $e');
//     }
//   }
// }