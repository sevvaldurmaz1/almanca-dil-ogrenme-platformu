import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function(String, String) onRegister;

  RegisterScreen({required this.onRegister});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PratikDeutsch')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/arkaaplan.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0), 
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5), 
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(14.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 7.0), 
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0), 
                  ElevatedButton(
                    onPressed: () {
                      widget.onRegister(
                        _usernameController.text,
                        _passwordController.text,
                      );
                      Navigator.pop(context); 
                    },
                    child: Text('Kayıt Ol'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white.withOpacity(0.7), 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

