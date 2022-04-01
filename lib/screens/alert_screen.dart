import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);
  void displayDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Titulo'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es el contenido de la alerta'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(size: 50)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              //este codigo es para poner un boton con caracteriasticas individuales
              // style: ElevatedButton.styleFrom( primary: Colors.red, shape: const StadiumBorder(), elevation: 10),
              child: const Padding(
                //padding del boton
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //tamaño del boton
                child: Text(
                  'Mostar alerta',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () => displayDialog(context))),
      //boton azul
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }
}
