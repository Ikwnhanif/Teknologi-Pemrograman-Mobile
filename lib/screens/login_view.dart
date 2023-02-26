import 'package:flutter/material.dart';
import 'package:tugas1/constants.dart';
import 'package:tugas1/screens/home.dart';
import 'package:tugas1/screens/register_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "assets/images/icon_login.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Login Menu",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Selamat Datang di Menu Login, Silahkan isi Username dan Password !",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          onChanged: (value) {
            username = value;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Username",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          autofocus: false,
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        TextFormField(
          onChanged: (value) {
            password = value;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.underlineTextField,
                width: 1.5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPalette.hintColor),
          ),
          style: TextStyle(color: Colors.white),
          obscureText: true,
          autofocus: false,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        ElevatedButton(
          onPressed: () {
            String text = "";
            if (username == "user" && password == "user") {
              setState(() {
                text = "Login Sukses";
                isLoginSuccess = true;
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            } else {
              setState(() {
                text = "Login Gagal, Input Username/Password Salah!";
                isLoginSuccess = false;
              });
            }
            SnackBar snackBar = SnackBar(
              content: Text(text),
              backgroundColor:
                  (isLoginSuccess) ? Colors.greenAccent : Colors.red[900],
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        ElevatedButton(
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RegisterPage.routeName);
          },
        ),
      ],
    );
  }
}
