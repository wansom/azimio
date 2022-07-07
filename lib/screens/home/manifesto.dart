import 'package:azimio/screens/home/azimio_manifesto.dart';
import 'package:azimio/screens/home/otichilo_manifesto.dart';
import 'package:flutter/material.dart';

class Manifesto extends StatefulWidget {
  const Manifesto({Key? key}) : super(key: key);

  @override
  State<Manifesto> createState() => _ManifestoState();
}

class _ManifestoState extends State<Manifesto> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Text(
                'Ottichilo Manifesto',
                style: TextStyle(color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
           OtichiloManifesto(),

          ],
        ),
      ),
    );
  }
}
final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];

