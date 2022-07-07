import 'package:azimio/constants.dart';
import 'package:azimio/screens/utils/loading.dart';
import 'package:azimio/services/auth.dart';
import 'package:azimio/services/database.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();
  // text field state
  String email = '';
  String first_name='';
  String last_name='';
  String county='';
  String feedback ='';
  String gender ='';

  String password = '';
  String error = '';
  bool loading = false;
  bool vote=false;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return  loading
        ? const Loading()
        : Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            validator: (val) => val!.isEmpty ? 'Enter your first name' : null,
            onChanged: (val) {
              setState(() => first_name = val);
            },
            decoration: const InputDecoration(
              hintText: "First Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: (val) => val!.isEmpty
                  ? 'Enter a last name'
                  : null,
              onChanged: (val) {
                setState(() => last_name = val);
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Last Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: (val) => val!.isEmpty
                  ? 'Enter email'
                  : null,
              onChanged: (val) {
                setState(() => email = val);
              },
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: (val) => val!.isEmpty
                  ? 'Enter Feedback'
                  : null,
              onChanged: (val) {
                setState(() => feedback = val);
              },
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Feedback",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.location_history_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child:                     Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ), //SizedBox
                Text(
                  'Will you vote for me?',
                  style: TextStyle(fontSize: 17.0),
                ), //Text
                SizedBox(width: 10), //SizedBox
                /** Checkbox Widget **/
                Checkbox(
                  value: vote,
                  onChanged: (value) {
                    setState(() {
                      vote = value!;
                    });
                  },
                ), //Checkbox
              ], //<Widget>[]
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(

            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12),),),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                //setState(() => loading = true);

                _db.addFeedback(email ,last_name,feedback,first_name,vote);
                Toast.show("Submitted successfully", duration: Toast.lengthShort, gravity:  Toast.top);

              }
            },
            child: Text("Submit".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
