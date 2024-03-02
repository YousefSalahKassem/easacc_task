import 'package:dartz/dartz.dart';
import 'package:easacc_task/core/errors/failures.dart';
import 'package:easacc_task/features/authentication/data/interface/i_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends IAuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  @override
  Future<Either<Failure, Unit>> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      final isUserLoggedInFromGoogle = await _checkGoogleLoggedIn();
      if (isUserLoggedInFromGoogle) {
        await GoogleSignIn().disconnect();
      }
      await _auth.signOut();
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    }
  }

  Future<bool> _checkGoogleLoggedIn() async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      final userCredential = await user.getIdTokenResult();
      if (userCredential.signInProvider == "google.com") {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
