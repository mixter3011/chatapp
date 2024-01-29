import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _pwController  = TextEditingController();

  final void Function()? onTap;
  
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {

    final authService = AuthService();


    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    }

    catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/images-removebg-preview.png',
            width: 120,
            height: 120,
          ),

          const SizedBox(height: 25),

          Text(
            "Welcome to the Open Chat Forum !",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),


          MyTextField(
            hintText: "Username",
            obscureText: false,
            controller: _emailController,
          ),
          
          const SizedBox(height: 10.0),
          
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 25),

          MyButton(
            text: "Login",
            onTap: () => login(context),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a User ?",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                " Register Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
            ),
           ],
          ),
        ]),
      ),
    );
  }
}