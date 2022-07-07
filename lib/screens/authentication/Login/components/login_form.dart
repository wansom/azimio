import 'package:azimio/components/already_have_an_account_acheck.dart';
import 'package:azimio/constants.dart';
import 'package:azimio/screens/utils/loading.dart';
import 'package:flutter/material.dart';
import '../../../../services/auth.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

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
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  onSaved: (email) {},
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
                const SizedBox(height: defaultPadding),
                Hero(
                  tag: "login_btn",
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signinWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'Could not sign in with those credentials';
                          });
                        }else{
                      setState(() => loading = false);
                      Navigator.pop(context);
                      }
                      }
                    },
                    child: Text(
                      "Login".toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
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
