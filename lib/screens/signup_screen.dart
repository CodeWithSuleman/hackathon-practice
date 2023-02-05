import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project4/screens/constants/constants_colors.dart';
import 'package:project4/screens/login_screen.dart';
import 'package:project4/widgets/custom_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void createAccount() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (username == '' || email == '' || password == '') {
      print("Please fill the details ");
    } else {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print("User created!");
        if (credential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Card()),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/4.jpg',
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.011),
              const Padding(
                padding: EdgeInsets.only(right: 50, left: 8),
                child: Text(
                  "Enter Your Credentials to Continue",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.011),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: "Enter Username",
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: "Enter Email",
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: "Enter Password",
                ),
              ),
              Row(
                children: [
                  const Text("By Contunuing You Agree to our"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms of Service",
                        style: TextStyle(color: Color(ConstantColors.color2)),
                      )),
                ],
              ),
              Row(
                children: [
                  const Text("and"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Color(ConstantColors.color2)),
                      )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.08,
                child: GrButton(
                    callBack: () {
                      createAccount();
                    },
                    icon: const Icon(Icons.ac_unit_sharp),
                    bcolor: Color(ConstantColors.color2),
                    bName: "Sign Up"),
              ),
              Row(
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogIn()),
                        );
                      },
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                            color: Color(ConstantColors.color2), fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
