import 'package:flutter/material.dart';
import 'package:list_view_proj/components/defult_text_button.dart';
import 'package:list_view_proj/components/defult_text_form_field.dart';
import 'package:list_view_proj/views/hello_screen.dart';
import 'package:list_view_proj/views/sign_up_screen.dart';

import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isObsecureText = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

bool isCheckedRememberMe = false;

class _LoginScreenState extends State<LoginScreen> {
  DateTime now = DateTime.now();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DateFormat('EEE, MMM d').format(now),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Color(0xFF125A93),
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Example@example.com',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your email";
                            }
                            if (!value.contains('@')) {
                              return "please enter valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          labelText: 'e_Xample',
                          isObsecure: isObsecureText,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObsecureText = !isObsecureText;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isCheckedRememberMe,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isCheckedRememberMe = newValue!;
                          });
                        },
                      ),
                      const Text(
                        'Remeber me',
                        style: TextStyle(
                          color: Color(0xFFADADAD),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot password',
                              style: TextStyle(
                                  color: Color(0xFF125A93), fontSize: 14),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HelloScreen(name: 'Mohamed',)));
                              }
                            },
                            textColor: Colors.white,
                            backgroundColor: const Color(0xFF125A93),
                            text: 'Sign in'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account?',
                          style: TextStyle(
                              color: Color(0xFF868686), fontSize: 14)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()));
                          },
                          child: const Text('Create now',
                              style: TextStyle(
                                  color: Color(0xFF125A93), fontSize: 14)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
