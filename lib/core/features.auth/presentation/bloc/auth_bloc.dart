import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final _storage = FlutterSecureStorage();

  AuthBloc({
    required this.registerUseCase,
    required this.loginUseCase,
  }) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user =
          await registerUseCase(event.username, event.email, event.password);
      emit(AuthSuccess(message: "Registration Successful"));
    } catch (error) {
      emit(AuthFailure(error: "Registration Failed"));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await loginUseCase(event.email, event.password);
      await _storage.write(key: 'token', value: 'user.token');
      print('token: ${user.token}');
      emit(AuthSuccess(message: "Login Success"));
    } catch (error) {
      emit(AuthFailure(error: "Login Failed"));
    }
  }
}
