import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nexus/shared/widgets/custom_button.dart';
import 'package:shop_nexus/shared/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: _nameController, labelText: 'Name'),
            const SizedBox(height: 16),
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
            CustomButton(text: 'Register', onPressed: _register),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _register() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    // Dummy register - just navigate to login
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful! Please login.')),
    );
    context.go('/login');
  }
}
