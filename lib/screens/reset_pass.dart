import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../exercise/screens/course.dart';
import 'components/components.dart';

class resetpass extends StatefulWidget {
  const resetpass({Key? key}) : super(key: key);

  @override
  State<resetpass> createState() => _ResetPassState();
}

class _ResetPassState extends State<resetpass> {
  final TextEditingController _emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() => setState(() {}));
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
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                children: const [
                  Text(
                    '\n\nReset Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 55.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'To change password Enter email below!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 95),
              /*email*/ textField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                hinttext: 'Email',
                suffixIcon: _emailController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: const Icon(Icons.close,
                            size: 20.0, color: Colors.black),
                        onPressed: () => _emailController.clear(),
                      ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text)
                        .then((value) => Navigator.of(context).pop());
                    if (formKey.currentState!.validate()) {
                      // Validation successful, submit the form
                      // Add your code for submitting the form here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.amber,
                  ),
                  child: Text('Reset password'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
