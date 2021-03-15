import 'package:FoodDeliveryApp/Screens/bottomNavBar/bottomnavbar.dart';
import 'package:FoodDeliveryApp/Widget/CustomTextField.dart';
import 'package:flutter/material.dart';

class SiginScreen extends StatefulWidget {
  SiginScreen({Key key}) : super(key: key);

  @override
  _SiginScreenState createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/logo.jpg'),
                  ),
                ),
              ),
              CustomField(
                label: "email",
                icon: Icons.email,
                keyField: emailKey,
                type: TextInputType.emailAddress,
                controller: emailController,
              ),
              CustomField(
                label: "password",
                icon: Icons.lock,
                keyField: passwordKey,
                type: TextInputType.text,
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text('Forgot Password?!',
                      style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                ),
              ),
              Builder(
                builder: (BuildContext context) {
                  return FlatButton(
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        Scaffold.of(context)
                            .showSnackBar(snack('Some Field Required!'));
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return BottomNavBar();
                        }));
                      }
                    },
                    child: Text(
                      "sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.black,
                  );
                },
              )
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
