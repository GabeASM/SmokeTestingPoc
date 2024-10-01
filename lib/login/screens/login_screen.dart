import 'package:flutter/material.dart';
import 'package:smoke_poc/home/screens/home_screen.dart';
import 'package:smoke_poc/login/widgets/emailfield_widget.dart';
import 'package:smoke_poc/login/widgets/password_field.dart';
import 'package:get_it/get_it.dart';
import 'package:smoke_poc/login/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = GetIt.I<AuthService>();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _logIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final result = await _authService.logInUser(email, password);
      if (result) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const HomeScreen()),
        );
      } else {
        setState(() {
          _errorMessage = 'Credenciales incorrectas';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Ocurrió un error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EmailFieldWidget(controller: _emailController), 
            const SizedBox(height: 16),
            PasswordFieldWidget(controller: _passwordController), 
            const SizedBox(height: 16),
            if (_isLoading) const CircularProgressIndicator(),
            if (_errorMessage != null) Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            if (!_isLoading)
              ElevatedButton(
                onPressed: _logIn,
                child: const Text('Iniciar sesión'),
              ),
          ],
        ),
      ),
    );
  }
}
