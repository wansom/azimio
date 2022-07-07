import 'package:azimio/models/otichilo.dart';
import 'package:azimio/models/secretariat_model.dart';
import 'package:azimio/services/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 800,
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // menu text
              Container(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Row(
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.exit_to_app_outlined,
                        size: 30,
                        color: Colors.black54,),
                      label: Text('logout',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {
                        _auth.signOut();
                      },
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/cashpro-c343e.appspot.com/o/ab.jpg?alt=media&token=a4a44d48-6390-47b7-8900-967719fc2217'),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(' Azimio Presidential Team',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // tabbar
              SizedBox(
                height: 320,
                width: double.maxFinite,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: azimioSecretariat.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 220,
                              height: 260,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image:  DecorationImage(
                                    image: NetworkImage(
                                        azimioSecretariat[index].image),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                  azimioSecretariat[index].name+ "-" + azimioSecretariat[index].role
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 8),
              // Governors text
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Ottichilo Projects',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 365,
                width: double.maxFinite,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.vertical,
                    itemCount: otichiloData.length,
                    itemBuilder: (_, index) {
                      return _singleNews(index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _singleNews(int index) {
    return Stack(children: [
      Container(
        height: 250,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(otichiloData[index].image),
            ),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
      ),
      Positioned(
          bottom: 20.0,
          left: 10.0,
          child: SizedBox(
              width: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Text(otichiloData[index].text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white),),
                  ),
                ],
              ))),
      Positioned(
          top: 20.0,
          right: 10.0,
          child: SizedBox(
              width: 15,
              child: Text("#SAVEARTH",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
              ),
          ),
      ),
    ]);
  }

}
