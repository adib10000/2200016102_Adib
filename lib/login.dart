import 'package:flutter/material.dart';
import 'package:shrine/home.dart'; // Make sure this path is correct

void main() {
  runApp(const ShrineApp());
}

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RegistrationPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();

  void _clearFields() {
    _usernameController.clear();
    _passwordController.clear();
    _retypePasswordController.clear();
  }

  void _register() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        leading: const Icon(Icons.diamond, color: Colors.black),
        title: const Text(
          'SHRINE',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Icon(Icons.diamond, size: 80, color: Colors.black),
            const SizedBox(height: 16),
            const Text(
              'Registrasi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem Ipsum dolar sit amet, consectetur adipiscing elit',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              label: 'Masukan Nama User',
              hint: 'Username',
              controller: _usernameController,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              label: 'Masukan Password',
              hint: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              label: 'Masukan Kembali Password',
              hint: 'Password',
              obscureText: true,
              controller: _retypePasswordController,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _clearFields,
                  child: const Text('Hapus',
                      style: TextStyle(color: Colors.purple)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Register',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            ),
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
        ),
      ],
    );
  }
}
