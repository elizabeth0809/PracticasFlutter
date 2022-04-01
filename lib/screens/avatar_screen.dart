import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elizabeth'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
                child: const Text('ES'), backgroundColor: Colors.amber[900]),
          )
        ],
      ),
      body: Center(
          child: CircleAvatar(
        maxRadius: 100,
        backgroundImage: NetworkImage(
            'https://static-s.aa-cdn.net/img/ios/1350301428/16357580ebc617558c1ad9bf4f914ec6?v=1'),
      )),
    );
  }
}
