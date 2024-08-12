import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page_using_firebase/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailtextcontroller = TextEditingController();
    TextEditingController passwordtextcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Sign  Up Screen"),
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
            TextField(
              decoration: InputDecoration(
                  hintText: "Confirm your  Password",
                  enabledBorder: OutlineInputBorder()),
              controller: confirmpasswordcontroller,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
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
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
