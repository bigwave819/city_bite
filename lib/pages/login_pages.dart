import 'package:cityfood/pages/bottom_nav.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          // 🔹 Top-right decorative circle
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 172, 194, 243),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // 🔹 Bottom-left decorative circle
          Positioned(
            bottom: -90,
            left: 40,
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 173, 184, 246),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // 🔹 Main login content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                shadowColor: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Intro Text
                      Text(
                        "Hello! Welcome Again...",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Email Field
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            prefixIcon: Icon(Icons.mail),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 12, 21, 71),
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(66, 0, 16, 106),
                              blurRadius: 8,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
