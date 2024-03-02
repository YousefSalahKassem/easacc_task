import 'package:dartz/dartz.dart';
import 'package:easacc_task/core/errors/failures.dart';
import 'package:easacc_task/features/authentication/data/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IAuthService {
  static final provider = Provider(
    (ref) => AuthService(FirebaseAuth.instance),
  );

  Future<Either<Failure, Unit>> loginWithGoogle();

  Future<Either<Failure, Unit>> loginWithFacebook();

  Future<Either<Failure, Unit>> logout();
}
