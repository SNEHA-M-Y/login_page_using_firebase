import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page_using_firebase/screens/home_screen.dart';
import 'package:login_page_using_firebase/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailtextcontroller = TextEditingController();
    TextEditingController passwordtextcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Sign In Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your Email ID",
                  enabledBorder: OutlineInputBorder()),
              controller: emailtextcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your  Password",
                  enabledBorder: OutlineInputBorder()),
              controller: passwordtextcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Dont you have account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text("Sign Up"))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailtextcontroller.text,
                          password: passwordtextcontroller.text)
                      .then((onValue) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenHome(),
                        ));
                  });
                },
                child: Text("Log In"))
          ],
        ),
      ),
    );
  }
}
