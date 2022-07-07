import 'package:azimio/constants.dart';
import 'package:azimio/screens/utils/feedback_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
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
                        child: SvgPicture.asset("assets/icons/signup.svg"),
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
                      child:const FeedbackForm()
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
