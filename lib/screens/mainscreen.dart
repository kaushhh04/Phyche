import 'package:flutter/material.dart';
import 'package:phyche/screens/signup.dart';
import 'components/components.dart';
import 'loginPage.dart';

class mainscreen extends StatelessWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '\n\n\n\nph',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '\n\n\n\n\ny',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\n\n\n\nche',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Let\'s make happiness',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              commonButton(
                text: 'Log In',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                color: Colors.white,
                textcolor: Colors.black,
                fontsize: 30.0,
                border: 3.0,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              commonButton(
                text: 'Sign Up',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                fontsize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}