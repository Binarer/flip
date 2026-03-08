import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flip/core/di/injection.dart';
import 'package:flip/features/auth/presentation/blocs/auth_event.dart';
import 'package:flip/features/auth/presentation/blocs/auth_state.dart';
import 'package:flip/features/auth/presentation/screens/auth_screen.dart';
import 'package:flip/presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI().init();
  runApp(const FlipApp());
}

final _router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
  ],
);

class FlipApp extends StatelessWidget {
  const FlipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DI().authBloc..add(AppStarted()),
      child: ShadApp.router(
        title: 'Flip Player',
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ShadThemeData(
          brightness: Brightness.dark,
          colorScheme: const ShadZincColorScheme.dark(
            background: Color(0xFF000000),
            foreground: Color(0xFFFFFFFF),
            card: Color(0xFF0A0A0A),
            primary: Color(0xFFFFFFFF),
            secondary: Color(0xFF27272A),
            muted: Color(0xFF27272A),
            accent: Color(0xFF27272A),
            border: Color(0xFF27272A),
          ),
        ),
      ),
    );
  }
}
