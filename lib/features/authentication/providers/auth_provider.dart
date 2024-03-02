import 'package:dartz/dartz.dart';
import 'package:easacc_task/core/notifiers/global_state.dart';
import 'package:easacc_task/features/authentication/data/interface/i_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends StateNotifier<GlobalStates<Unit>> {
  final IAuthService _authService;
  static final provider =
      StateNotifierProvider<AuthProvider, GlobalStates<Unit>>(
    (ref) => AuthProvider(
      ref.watch(IAuthService.provider),
    ),
  );

  AuthProvider(this._authService) : super(GlobalStates.initial());

  Future<void> signOut() async {
    await _authService.logout();
  }

  Future<void> loginWithGoogle() async {
    state = GlobalStates.loading();
    final result = await _authService.loginWithGoogle();
    result.fold(
      (l) => state = GlobalStates.fail(
        l.toString(),
      ),
      (r) => state = GlobalStates.success(r),
    );
  }

  Future<void> loginWithFacebook() async {
    state = GlobalStates.loading();
    final result = await _authService.loginWithFacebook();
    result.fold(
      (l) => state = GlobalStates.fail(
        l.toString(),
      ),
      (r) => state = GlobalStates.success(r),
    );
  }
}
