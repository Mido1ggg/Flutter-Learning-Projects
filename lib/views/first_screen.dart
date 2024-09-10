import 'package:flutter/material.dart';
import 'package:list_view_proj/components/defult_text_form_field.dart';
import 'package:list_view_proj/views/secound_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isObsecureText = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 180,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
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
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    labelText: 'Password',
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
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecoundScreen()));
                    }
                  },
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  child: const Text('Log In',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot password')),
                // const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    TextButton(
                        onPressed: () {}, child: const Text('Sign up now'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
