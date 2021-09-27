import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success = true;
  String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF504094E),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
          child: Text(
            "Register",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: Container(
        height: 1000,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xF541012C),
              Color(0xF504094E),
              Color(0xFF040C7C),
              Colors.teal,
              Color(0xFFE49E07),
              Color(0xFFE43307),
              Color(0xFF8D0505),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 180, 10, 30),
          child: Form(
            key: _formKey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //? E-Mail
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          labelText: "E-Mail",
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        validator: (String mail) {
                          if (mail.isEmpty) {
                            return "Please write an e-mail";
                          }
                          return null;
                        },
                      ),
                      //? Şifre
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (String password) {
                          if (password.isEmpty) {
                            return "please write an password";
                          }
                          return null;
                        },
                        obscureText:
                            true, //! prevents the password from appearing.
                      ),
                      //? Kayıt ol buttonu
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        alignment: Alignment.center,
                        child: SignInButtonBuilder(
                          icon: Icons.person_add,
                          backgroundColor: Color(0xF504094E),
                          fontSize: 18,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _register();
                            }
                          },
                          text: "Register",
                        ),
                      ),
                      //? Geri bildirim
                      Container(
                        alignment: Alignment.center,
                        child: Text(_success == null ? '' : _message ?? ''),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //! Clear controllers when widget is closed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Kayıt işlemi için
  void _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _message = "Registration Successful ${user.email}";
        });
      } else {
        setState(() {
          _success = false;
          _message = "Registration Failed.";
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _success = false;
        _message = "Registration Failed.\n\n$e";
      });
    }
  }
}
