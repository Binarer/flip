import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flip/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:flip/features/auth/presentation/blocs/auth_event.dart';
import 'package:flip/features/auth/presentation/blocs/auth_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect Accounts',
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 20),
            
            // VK Account Card
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return _AccountCard(
                    title: 'VK ID Connected',
                    subtitle: state.user.fullName,
                    photoUrl: state.user.photoUrl,
                    onAction: () => context.read<AuthBloc>().add(LogoutPressed()),
                    actionLabel: 'Logout',
                    icon: Icons.check_circle_rounded,
                    iconColor: Colors.blue,
                  );
                }
                
                return _AccountCard(
                  title: 'VK ID',
                  subtitle: 'Link your VK account to sync your music',
                  onAction: () => context.read<AuthBloc>().add(VKLoginPressed()),
                  actionLabel: state is AuthLoading ? 'Linking...' : 'Link account',
                  icon: Icons.add_circle_outline_rounded,
                  isLoading: state is AuthLoading,
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            // SoundCloud Account Card (Placeholder for now)
            _AccountCard(
              title: 'SoundCloud',
              subtitle: 'Link your SoundCloud account',
              onAction: () {}, // To be implemented
              actionLabel: 'Link account',
              icon: Icons.add_circle_outline_rounded,
            ),
            
            const SizedBox(height: 40),
            
            Text(
              'App Settings',
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 16),
            
            ShadButton.outline(
              width: double.infinity,
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.dark_mode_rounded),
                  SizedBox(width: 12),
                  Text('Appearance'),
                  Spacer(),
                  Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            ShadButton.outline(
              width: double.infinity,
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.info_outline_rounded),
                  SizedBox(width: 12),
                  Text('About Flip'),
                  Spacer(),
                  Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? photoUrl;
  final VoidCallback onAction;
  final String actionLabel;
  final IconData icon;
  final Color? iconColor;
  final bool isLoading;

  const _AccountCard({
    required this.title,
    required this.subtitle,
    this.photoUrl,
    required this.onAction,
    required this.actionLabel,
    required this.icon,
    this.iconColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (photoUrl != null)
                CircleAvatar(
                  backgroundImage: NetworkImage(photoUrl!),
                  radius: 20,
                )
              else
                Icon(icon, size: 40, color: iconColor ?? theme.colorScheme.mutedForeground),
              
              const SizedBox(width: 16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ShadButton(
            width: double.infinity,
            onPressed: isLoading ? null : onAction,
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}
