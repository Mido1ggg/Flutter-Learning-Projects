import 'package:flutter/material.dart';
import 'package:list_view_proj/components/defult_text_button.dart';
import 'package:list_view_proj/components/defult_text_form_field.dart';
import 'package:list_view_proj/views/hello_screen.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

bool isObsecureText = true;
TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordController_2 = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

bool isCheckedRememberMe = false;

class _SignUpScreen extends State<SignUpScreen> {
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
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFF125A93),
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lets get started with your information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          labelText: 'User name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your user name";
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
                    'Last name',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                          labelText: 'Last name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your Last name";
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Confirm password',
                    style: TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextFormField(
                          controller: passwordController_2,
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
                              return "Please enter your confirmation password";
                            }
                            if (value != passwordController.text) {
                              return "Confirmation password does not match";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HelloScreen(
                                            name: nameController.text)),
                                    (route) => false);
                              }
                            },
                            textColor: Colors.white,
                            backgroundColor: const Color(0xFF125A93),
                            text: 'Sign up'),
                      ),
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
