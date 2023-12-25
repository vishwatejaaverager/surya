import 'package:flutter/material.dart';
import 'package:surya/admin/admin.dart';
import 'package:surya/home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final email = 'store1';
  final pass = 'store1';

  final email1 = 'admin';
  final pass1 = 'admin';

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _login() {
      // Add your login logic here
      String email = emailController.text;
      String password = passwordController.text;

      // Validate email and password (add your own validation logic)
      if (email.isNotEmpty && password.isNotEmpty) {
        if (email == email && password == pass) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ), (route) => false);
        } else if (email == email1 && password == pass1) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const Admin();
            },
          ));
        }
        // Perform login actions (e.g., call an authentication service)
        // For demonstration purposes, we'll just print the email and password
        print('Email: $email, Password: $password');
      } else {
        // Display an error message or handle invalid input
        print('Invalid email or password');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
