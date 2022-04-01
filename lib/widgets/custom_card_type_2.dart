import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? name;
  const CustomCardType2({Key? key, required this.imageUrl, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        //redondeo de la trajeta
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //boxshadow version flutter
        elevation: 10,
        //color de la sombra
        shadowColor: Colors.amber.withOpacity(0.2), //color y opacidad
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/cargando.gif'),
              width: double.infinity, //esto agarra todo el ancho
              height: 200, //tamaño de la caja
              fit: BoxFit.cover, //toma todo el tamaño de la imagen
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (name != null)
              Container(
                //espaciado entre el mensaje como un padding
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                //texto en la imagen
                child: Text(name ?? 'Sin titulo'),
              )
          ],
        ));
  }
}
