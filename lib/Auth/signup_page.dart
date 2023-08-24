import 'package:ecommerceapp/Auth/login_page.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Audio",
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "It's modular and designed to last",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 230,
                  ),
                  textFormFieldBuilder(
                    text: "Email",
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                      controller: _emailController,
                      validator:  (value){
                        if(_emailController.text.isEmpty){
                          return "Empty fields,enter some information";
                        }
                        else if(!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w ]{2,4}').hasMatch(value!))
                        {
                          return "email form is not validated";
                        }
                        else{
                          return null;
                        }
                      },
                    ob: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  textFormFieldBuilder(
                    text: "Password",
                    icon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                      controller: _passwordController,
                      validator:  (value){
                        if(_passwordController.text.isEmpty){
                          return "Empty fields,enter some information";
                        }
                        else if(_passwordController.text.length<6){
                          return "Password should be 6  digits or more";
                        }
                        else{
                          return null;
                        }
                      },
                    ob: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                      onTap: (){
                        if(_form.currentState!.validate()){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>const LoginPage())
                          );
                        }
                      },
                      child: buttonBuilder(text: "Sign Up")),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialMediaBuilder(image: apple, color: Colors.white),
                      const SizedBox(
                        width: 30,
                      ),
                      socialMediaBuilder(image: google, color: Colors.white),
                      const SizedBox(
                        width: 30,
                      ),
                      socialMediaBuilder(image: facebook, color: Colors.white),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        "If you have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          "Sign In here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF0ACF83),
                            color: Color(0xFF0ACF83),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
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

  Container socialMediaBuilder({required String image, required Color color}) {
    return Container(
      width: 50,
      height: 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Image.asset(
        image,
        width: 35,
      )),
    );
  }

  Container buttonBuilder({
    required String text,
  }) {
    return Container(
      width: 373,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xFF0ACF83), borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Padding textFormFieldBuilder(
      {required String text,
      required Icon icon,
      required TextEditingController controller,
      required FormFieldValidator validator,
      required bool ob,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: ob,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: icon,
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
