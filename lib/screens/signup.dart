import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phyche/exercise/screens/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/components.dart';
import 'loginPage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final name = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

  var formKey = GlobalKey<FormState>();
  String errorText = 'Can\'ot be empty';

  @override
  void initState() {
    super.initState();

    name.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Ph',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'y',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 50.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'che',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 20,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                '\n\n Sign up',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              /*name*/ textField(
                controller: name,
                hinttext: 'Name',
                keyboardType: TextInputType.name,
                suffixIcon: name.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: const Icon(Icons.close,
                            size: 20.0, color: Colors.black),
                        onPressed: () => name.clear(),
                      ),
              ),
              const SizedBox(height: 15),
              /*email*/ textField(
                controller: _emailController,
                hinttext: 'Email',
                keyboardType: TextInputType.emailAddress,
                suffixIcon: _emailController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: const Icon(Icons.close,
                            size: 20.0, color: Colors.black),
                        onPressed: () => _emailController.clear(),
                      ),
              ),
              const SizedBox(height: 15),
              /*password*/ textField(
                keyboardType: TextInputType.emailAddress,
                controller: _passwordController,
                hinttext: 'Password',
                isPassword: true,
                suffixIcon: _passwordController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: isPasswordVisible
                            ? const Icon(Icons.visibility_off,
                                size: 20.0, color: Colors.black)
                            : const Icon(Icons.visibility,
                                size: 20.0, color: Colors.black),
                        onPressed: () => setState(
                          () => isPasswordVisible = !isPasswordVisible,
                        ),
                      ),
                onChange: (value) => setState(() => password = value),
                isPasswordVisible: isPasswordVisible,
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) {
                          print("Created New Account");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => course()),
                      );
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                    prefs.setString("email", _emailController.text);
                    if (formKey.currentState!.validate()) {
                      // Validation successful, submit the form
                      // Add your code for submitting the form here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.amber,
                  ),
                  child: Text('Create Account'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
