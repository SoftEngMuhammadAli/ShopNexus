import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nexus/features/auth/presentation/providers/auth_provider.dart';
import 'package:shop_nexus/shared/widgets/custom_button.dart';
import 'package:shop_nexus/shared/widgets/custom_textfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _emailController,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Login',
              onPressed: _login,
              isLoading: authState.isLoading,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go('/register'),
              child: const Text('Don\'t have an account? Register'),
            ),
            if (authState.hasError) ...[
              const SizedBox(height: 16),
              Text(
                'Error: ${authState.error}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
            if (authState.hasValue && authState.value != null) ...[
              const SizedBox(height: 16),
              Text('Welcome, ${authState.value!.user.name}!'),
              ElevatedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Go to Home'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    ref.read(authProvider.notifier).login(email, password);
  }
}
