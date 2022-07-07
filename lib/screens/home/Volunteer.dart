import 'package:azimio/constants.dart';
import 'package:azimio/screens/utils/volunteerform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VoluntterScreen extends StatefulWidget {
  const VoluntterScreen({Key? key}) : super(key: key);

  @override
  State<VoluntterScreen> createState() => _VoluntterScreenState();
}

class _VoluntterScreenState extends State<VoluntterScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 800,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
          children: [
          const SizedBox(height: defaultPadding),
          Row(
          children: [
          const Spacer(),
          Expanded(
          flex: 8,
          child: Image.network("https://firebasestorage.googleapis.com/v0/b/cashpro-c343e.appspot.com/o/OttichiloKitiezoRunningMateWebsiteBanner.jpg?alt=media&token=bd058d33-8e14-41c5-a244-f8e3343bf4f6"),
          ),
          const Spacer(),
          ],
          ),
          const SizedBox(height: defaultPadding),
          ],
          ),
              Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 8,
                    child: VolunteeForm()
                  ),
                  Spacer(),
                ],
              ),
              // const SocalSignUp()
            ],
          ),
        ),
      ),
    );
  }
}
