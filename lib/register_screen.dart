import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'utils/custom_checkbox.dart';
import 'utils/custom_text_field.dart';
import 'utils/dashedline.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String passwordConfirmation = '';
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmation = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Register new\naccount',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    DashedLine(),
                  ],
                ),
                SizedBox(height: 40),
                CustomTextField(
                  labelText: 'Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Password',
                  obscureText: _obscureTextPassword,
                  onChanged: (value) {
                    password = value;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextPassword = !_obscureTextPassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  labelText: 'Password Confirmation',
                  obscureText: _obscureTextConfirmation,
                  onChanged: (value) {
                    passwordConfirmation = value;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextConfirmation
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextConfirmation = !_obscureTextConfirmation;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        CustomCheckbox(
                          value: _agreeToTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "By creating an account, you agree to our",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (email.isEmpty ||
                        password.isEmpty ||
                        passwordConfirmation.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields')),
                      );
                      return;
                    }

                    final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!emailRegExp.hasMatch(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Please enter a valid email address')),
                      );
                      return;
                    }

                    if (password != passwordConfirmation) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }

                    if (!_agreeToTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You must agree to the terms')),
                      );
                      return;
                    }

                    try {
                      await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(e.message ?? 'Registration failed')),
                      );
                    }
                  },
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
