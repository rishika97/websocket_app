import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'chat_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authBox = Hive.box('authBox');

  void _signUp() {
    _authBox.put('username', _usernameController.text);
    _authBox.put('password', _passwordController.text);
    _navigateToChat();
  }

  void _logIn() {
    final username = _authBox.get('username');
    final password = _authBox.get('password');

    if (username == _usernameController.text &&
        password == _passwordController.text) {
      _navigateToChat();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
  }

  void _navigateToChat() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  const ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: _logIn,
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
