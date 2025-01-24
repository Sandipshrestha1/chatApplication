import 'package:chat_app/core/features.auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/core/features.auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_app/core/features.auth/domain/usecases/register_use_case.dart';
import 'package:chat_app/core/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/features.auth/domain/usecases/login_use_case.dart';
import 'core/features.auth/presentation/pages/login_page.dart';
import 'core/features.auth/presentation/pages/register_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    final authRepository =
        AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSource());
    runApp(MyApp(
      authRepository: authRepository,
    ));
  });
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;

  const MyApp({super.key, required this.authRepository});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthBloc(
                  registerUseCase: RegisterUseCase(repository: authRepository),
                  loginUseCase: LoginUseCase(repository: authRepository),
                ))
      ],
      child: MaterialApp(
          title: "Flutter Demo",
          theme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home:
              //LoginPage(),
              RegisterPage(),
          //ChatPage(),
          // MessagePage(),

          routes: {
            '/login': (_) => LoginPage(),
            '/register': (_) => RegisterPage(),
          }),
    );
  }
}
