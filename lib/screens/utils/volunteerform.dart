import 'package:azimio/constants.dart';
import 'package:azimio/screens/utils/loading.dart';
import 'package:azimio/services/auth.dart';
import 'package:azimio/services/database.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class VolunteeForm extends StatefulWidget {
  const VolunteeForm({Key? key}) : super(key: key);

  @override
  State<VolunteeForm> createState() => _VolunteeFormState();
}

class _VolunteeFormState extends State<VolunteeForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();
  // text field state
  String email = '';
  String first_name='';
  String last_name='';
  String county='';
  String ward ='';
  String gender ='';

  String password = '';
  String error = '';
  bool loading = false;
  String dropdownValue="social media marketing";
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return loading
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
                  ? 'Enter county'
                  : null,
              onChanged: (val) {
                setState(() => county = val);
              },
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "County",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.location_history_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: (val) => val!.isEmpty
                  ? 'Enter ward'
                  : null,
              onChanged: (val) {
                setState(() => ward = val);
              },
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Ward",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.location_history_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child:  Row(
              children: [

                Text(
                  'Volunteer for?',
                  style: TextStyle(fontSize: 17.0),
                ), //Text
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['social media marketing', 'Mobilizer', 'Road Show campaign', 'Polling Station mobilizer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12))),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // setState(() => loading = true);
                _db.addVolunteers(email, first_name,last_name, county,ward,dropdownValue);
                Toast.show("Submitted successfully", duration: Toast.lengthShort, gravity:  Toast.top);
              }
            },
            child: Text("Register".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
