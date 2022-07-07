import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OtichiloManifesto extends StatefulWidget {
  const OtichiloManifesto({Key? key}) : super(key: key);

  @override
  State<OtichiloManifesto> createState() => _OtichiloManifestoState();
}

class _OtichiloManifestoState extends State<OtichiloManifesto> {
  final List<String> images =[


    'https://firebasestorage.googleapis.com/v0/b/cashpro-c343e.appspot.com/o/Manifesto%20Report%20updat.png?alt=media&token=a1912aab-fb0a-40fa-af5e-cb31b3d99f77',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated2.png?alt=media&amp;token=4bacf180-ab41-433c-bf5f-8f0d87f9ddae',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated3.png?alt=media&amp;token=0f84857c-78a8-4176-b8f0-76028d0536d9',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated4.png?alt=media&amp;token=7a90f095-6b42-4d37-9bf0-3c9e29e1c7b5',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated5.png?alt=media&amp;token=bd8d3e9d-c3ba-42cc-a1e1-596109e9de65',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated6.png?alt=media&amp;token=6876b42e-421f-450a-8a7f-a268e373811c',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated7.png?alt=media&amp;token=4487675f-571c-4558-8e13-44b6a6b506a2',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated8.png?alt=media&amp;token=b045db6b-f390-44f0-b2ff-8515feffcc17',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated9.png?alt=media&amp;token=b7064991-d26c-4af6-91d1-dc7f78249366',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated10.png?alt=media&amp;token=2ffd0ede-048c-4540-b503-ab98cc556aff',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated11.png?alt=media&amp;token=77089f30-8a2a-4384-b731-299a23658287',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated12.png?alt=media&amp;token=7b37cb53-d334-46c3-86b9-b8c7667ec602',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated13.png?alt=media&amp;token=085e7112-4662-429c-b140-b1dc542653b0',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated14.png?alt=media&amp;token=7bb818ef-a60a-40d6-bba8-be0937a8c33b',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated15.png?alt=media&amp;token=0fc5ebe2-1ffa-4265-a880-6cb8c6ee276d',
    'https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Manifesto%20Report%20updated16.png?alt=media&amp;token=0b6ffb67-1950-4b76-bb08-894269bfe00d',


  ];

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {

    final pages = List.generate(
        images.length,
            (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
          ),
          margin: EdgeInsets.symmetric(horizontal: 1, vertical: 4),
          child: Container(
            height: 480,
            width:450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
              image: DecorationImage(
                  image: NetworkImage(
                      images[index]),
                  fit: BoxFit.cover),
            ),

          ),
        ));
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 480,
            width:450,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          SizedBox(
           height: 20,
          ),
          SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              // strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }
}
