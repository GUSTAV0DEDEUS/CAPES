import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final idUser = FirebaseAuth.instance.currentUser?.uid;
  static final nameUser = FirebaseAuth.instance.currentUser?.displayName;

  AuthRepository(this._firebaseAuth);

  Future<void> register(String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        user = _firebaseAuth.currentUser;

        await user?.sendEmailVerification();

        await _firestore.collection('users').doc(user!.uid).set({
          'name': name,
          'email': email,
          'createdAt': Timestamp.now(),
        });
      }
    } catch (e) {
      print('Erro ao registrar usuário: $e');
      rethrow;
    }
  }

  // Função para autenticar o usuário
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Erro ao fazer login: $e');
      rethrow;
    }
  }

  // Obter o usuário atual
  User? get currentUser => _firebaseAuth.currentUser;
}
