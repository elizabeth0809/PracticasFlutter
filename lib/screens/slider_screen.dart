import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders & Checks'),
        ),
        body: Column(
          /*SingleChildScrollView esto hace que no se desborde los hijos y se pueda hacer scroll*/

          children: [
            Slider.adaptive(
                min: 10,
                max: 400,
                activeColor: AppTheme.primary,
                //esto hace que tengas divisiones la linea en el slider
                divisions: 5,
                //aqui hace que el slider se pueda mover
                value: _sliderValue,
                onChanged: _sliderEnabled
                    /**Esto desabilita el eslider si es null */
                    ? (value) {
                        _sliderValue = value;
                        setState(() {});
                        /**Esto envio los datos es decir el valor al value */
                      }
                    : null),
            Checkbox(
                value: _sliderEnabled,
                onChanged: (value) {
                  _sliderEnabled = value ?? true;
                  setState(() {});
                }),
            CheckboxListTile(
                activeColor: AppTheme.primary,
                title: const Text('Habilitar slider'),
                value: _sliderEnabled,
                onChanged: (value) => setState(() {
                      _sliderEnabled = value ?? true;
                    })),
            SwitchListTile(
                activeColor: AppTheme.primary,
                title: const Text('Habilitar slider'),
                value: _sliderEnabled,
                onChanged: (value) => setState(() {
                      _sliderEnabled = value ?? true;
                    })),
            const AboutListTile(),
            /**muestra las licencias que se esta usando */
            Expanded(
              //esto tamara todo el tamaño
              child: SingleChildScrollView(
                child: Image(
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/40/c5/3f/40c53ff5a0da610aa4daff660c962961.png'),
                  fit: BoxFit.contain,
                  //esto puede hacer que la imagen se agrande o disminuya
                  width: _sliderValue,
                ),
              ),
            )
          ],
        ));
  }
}
