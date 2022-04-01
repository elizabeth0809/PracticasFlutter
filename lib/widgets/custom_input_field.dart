import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus:
            false, //esto hace que automaticamente el foco se vaya al esta parte
        initialValue: '',
        obscureText: obscureText,
        keyboardType: keyboardType, //esto uno pone para definir el teclado
        textCapitalization: TextCapitalization
            .words, //capitalizar es poner la prima letra en mayuscula,
        onChanged: (value) {
          print('value: $value');
        },
        validator: (value) {
          //esto es un validador de ese campo
          if (value == null) return 'Este campo es requerido';
          return value.length < 3 ? 'Minimo de 3 letras' : null;
        },
        autovalidateMode: AutovalidateMode
            .onUserInteraction, //esto lanza la validacion en este caso cuando el usuario interactua
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText, //label que aparece como letras pequeñas azules
          helperText: helperText,
          /*texto de ayuda de la izquierda*/
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon),

          /** icono de la izquierda */
          /*prefixIcon: Icon(Icons.ac_unit),
             /*icono de la derecha*/
          icon: Icon(Icons.assignment_ind_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            counterText:
                '3 caracteres' /*texto de ayuda de la derecha*/)
                */
        ));
  }
}
