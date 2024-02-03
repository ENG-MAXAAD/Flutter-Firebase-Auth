import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/screens/forget_screen.dart';
import 'package:login_screen/screens/home_screen.dart';
import 'package:login_screen/screens/register_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHidden = true;
  final emailController = TextEditingController();
  final passwordlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 65),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login in to Your Account',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login in to Your Account',
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade900),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Container 2
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: emailController,
                          // controller: TextController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              prefixIconColor: Color(0xFF0F1D2C),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3.0, color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Enter your email'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: passwordlController,
                          obscureText: isHidden,
                          // controller: TextController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              prefixIconColor: Color(0xFF0F1D2C),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isHidden = !isHidden;
                                  });
                                  // print('Pressed IconButton');
                                },
                                icon: Icon(isHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              suffixIconColor: Color(0xFF0F1D2C),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.0, color: Color(0xFFB8DE60)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3.0, color: Color(0xFFB8DE60)),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Enter your password'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Forget Text
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            child: Text(
                              'Forget password ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF0F1D2C),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (contex) => ForgetScreen()),
                              );
                            },
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Button Design
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF0F1D2C),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // onTap: () {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => HomeScreen()));
                          // },
                          onTap: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordlController.text);
                              //Checking User and Password
                              if (FirebaseAuth.instance.currentUser != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              } else {
                                //Show success meesage
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Failed Email or Password'),
                                  ),
                                );
                              }
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('An error occurred: $error'),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don`t have an account?'),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F1D2C),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                          ),
                        ],
                      )
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
