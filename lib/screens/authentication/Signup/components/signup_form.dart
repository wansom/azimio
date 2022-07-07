import 'package:azimio/components/already_have_an_account_acheck.dart';
import 'package:azimio/constants.dart';
import 'package:azimio/screens/utils/loading.dart';
import 'package:azimio/services/auth.dart';
import 'package:azimio/services/database.dart';
import 'package:flutter/material.dart';

import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();
  // text field state
  String email = '';

  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: const InputDecoration(
                    hintText: "Your email",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    validator: (val) => val!.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      hintText: "Your password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.createWithEmailAndPassword(
                          email, password);
                      dynamic user = result.user;
                      _db.addUsers(user.uid, user.email);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Please supply a valid email';
                        });
                      }else{
                        setState(() => loading = false);
                        Navigator.pop(context);

                      }
                    }
                  },
                  child: Text("Sign Up".toUpperCase()),
                ),
                const SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
