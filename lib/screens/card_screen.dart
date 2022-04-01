import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
          //esto crea el pagging
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            CustomCardType1(),
            //separacion entre cards
            SizedBox(height: 5),
            CustomCardType2(
              name: 'hermoso paisaje',
              imageUrl:
                  'https://3.bp.blogspot.com/-u_ediz0l4qc/UpE2CTYlCGI/AAAAAAAAp-4/Jj4sDgFmXSE/s1600/428567_444188902279461_1222985211_n[1].jpg',
            ),
            SizedBox(height: 5),
            CustomCardType2(
              imageUrl:
                  'https://definicion.de/wp-content/uploads/2009/12/paisaje-1.jpg',
            ),
            SizedBox(height: 20),
          ]),
    );
  }
}
