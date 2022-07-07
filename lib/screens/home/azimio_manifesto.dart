import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AzimioManifesto extends StatefulWidget {
  const AzimioManifesto({Key? key}) : super(key: key);

  @override
  State<AzimioManifesto> createState() => _AzimioManifestoState();
}

class _AzimioManifestoState extends State<AzimioManifesto> {

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {

    final pages = List.generate(
        6,
            (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Container(
            height: 340,
            child: Center(
                child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
          ),
        ));
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 16),
          SizedBox(
            height: 340,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
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
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
