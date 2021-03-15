import 'package:FoodDeliveryApp/Screens/bottomNavBar/bottomnavbar.dart';
import 'package:FoodDeliveryApp/Widget/CustomTextField.dart';
import 'package:FoodDeliveryApp/Widget/logo.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> rePasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Logo(),
              CustomField(
                label: "email",
                icon: Icons.email,
                controller: emailController,
                keyField: emailKey,
                type: TextInputType.emailAddress,
              ),
              CustomField(
                label: "password",
                icon: Icons.lock,
                controller: passwordController,
                keyField: passwordKey,
                type: TextInputType.text,
              ),
              CustomField(
                label: "re-password",
                icon: Icons.lock,
                controller: rePasswordController,
                keyField: rePasswordKey,
                type: TextInputType.text,
              ),
              CustomField(
                label: "Phone",
                icon: Icons.phone,
                controller: phoneController,
                keyField: phoneKey,
                type: TextInputType.number,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signIn');
                  },
                  child: Text('have an account',
                      style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
              ),
              Builder(
                builder: (BuildContext context) {
                  return FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.pushReplacementNamed(
                            context, BottomNavBar.id);
                      } else {
                        Scaffold.of(context)
                            .showSnackBar(snack('Some Field Required!'));
                      }
                    },
                    child: Text(
                      "sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.black,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  snack(String content) {
    return SnackBar(
      content: Text(content),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    );
  }
}
