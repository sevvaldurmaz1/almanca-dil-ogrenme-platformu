import 'package:flutter/material.dart';
import 'package:almanca2/screens/home_page.dart';
import 'package:almanca2/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? registeredUsername;
  String? registeredPassword;

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 90.0), 
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), 
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
                    ),
                    SizedBox(height: 10.0), 
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Şifre'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0), 
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == registeredUsername &&
                      _passwordController.text == registeredPassword) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    // Hata mesajı göster
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Geçersiz kullanıcı adı veya şifre')),
                    );
                  }
                },
                child: Text('Giriş Yap'),
              ),
              SizedBox(height: 14.0), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(
                        onRegister: (username, password) {
                          setState(() {
                            registeredUsername = username;
                            registeredPassword = password;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Text('Kayıt Ol'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

