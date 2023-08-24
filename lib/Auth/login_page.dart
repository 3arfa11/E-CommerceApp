import 'package:ecommerceapp/Auth/signup_page.dart';
import 'package:ecommerceapp/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
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
                    height: 270,
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
                  ob: false),
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
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                      onTap: (){
                        if(_form.currentState!.validate()){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>const HomePage())
                          );
                        }
                      },
                      child: buttonBuilder(text: "Sign In")),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        "Didn't have any account?",
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                        },
                        child: const Text(
                          "Sign Up here",
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
        required bool ob
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: ob,
        controller: controller,
        validator:validator,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: icon,
            filled: true,
            fillColor: Colors.grey.shade200,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
