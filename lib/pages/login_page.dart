import 'package:flutter/material.dart';
import 'package:jurustani/bottomNavBar.dart';
import 'package:jurustani/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 200.0),
            Center(
              child: Image.asset(
                'assets/logo.png',
                scale: 15.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              obscureText: _isHidePassword,
              autofocus: false,
              initialValue: '',
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglePasswordVisibility();
                  },
                  child: Icon(
                    _isHidePassword ? Icons.visibility_off : Icons.visibility,
                    color: _isHidePassword ? Colors.grey : Colors.green,
                  ),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return BottomNavBar();
                  }));
                },
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              children: <Widget>[
                Text('Don\'t have an account? '),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
