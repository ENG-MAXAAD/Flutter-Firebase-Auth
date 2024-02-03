import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                          'Create an account',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Welcome! please enter your details.',
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
                          // controller: TextController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
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
                              hintText: 'Enter your name'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: emailController,
                          // controller: passwordlController,
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
                                    width: 2.0, color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3.0, color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Enter your password'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Forget Text

                      SizedBox(
                        height: 20,
                      ),
                      //Button Design
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF0F1D2C),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () async {
                            // print(emailController.text);
                            // print(passwordlController.text);
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordlController.text);
                              //Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    'User Created Successfully',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              );
                            } catch (error) {
                              print(error);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F1D2C),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
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
