import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flip/core/di/injection.dart';
import 'package:flip/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:flip/features/auth/presentation/blocs/auth_event.dart';
import 'package:flip/features/auth/presentation/blocs/auth_state.dart';
import 'package:flip/features/auth/presentation/screens/auth_screen.dart';
import 'package:flip/presentation/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DI().init();
  runApp(const FlipApp());
}

final _router = GoRouter(
  initialLocation: '/auth',
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
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;
    final isLoggingIn = state.matchedLocation == '/auth';

    if (authState is Unauthenticated && !isLoggingIn) {
      return '/auth';
    }
    if (authState is Authenticated && isLoggingIn) {
      return '/main';
    }
    return null;
  },
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
          colorScheme: const ShadSlateColorScheme.dark(),
        ),
      ),
    );
  }
}
