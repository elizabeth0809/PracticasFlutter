import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': 'Fernando',
      'last_name': 'herrera',
      'email': 'fernando@google.com',
      'phone': '55555555',
      'password': '123456',
      'role': 'Admin'
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('inputs y forms'),
      ),
      body: SingleChildScrollView(
          //con esto se puede hacer scroll y no se queda estatico al desplegar el teclado virtual
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              CustomInputField(
                labelText: 'Nombre',
                hintText: 'Nombre de usuario',
                helperText: 'Minimo 3 letras',
                formValues: formValues,
                formProperty: 'first_name',
              ),
              SizedBox(
                height: 30,
              ),
              CustomInputField(
                labelText: 'Apellido',
                hintText: 'Apellido de usuario',
                helperText: 'Minimo 3 letras',
                formValues: formValues,
                formProperty: 'last_name',
              ),
              SizedBox(
                height: 30,
              ),
              CustomInputField(
                labelText: 'Correo',
                hintText: 'Correo de usuario',
                helperText: 'correo valido',
                keyboardType: TextInputType.emailAddress,
                formValues: formValues,
                formProperty: 'email',
              ),
              SizedBox(
                height: 30,
              ),
              CustomInputField(
                labelText: 'Telefono',
                hintText: 'Ingresa un numero valido',
                helperText: 'minimo 12 numeros',
                keyboardType: TextInputType.number,
                formValues: formValues,
                formProperty: 'phone',
              ),
              SizedBox(
                height: 30,
              ),
              CustomInputField(
                labelText: 'Contraseña',
                hintText: 'Ingresa una contraseña',
                helperText: 'minimo 5 caracteres',
                obscureText: true,
                formValues: formValues,
                formProperty: 'password',
              ),
              SizedBox(
                height: 30,
              ),
              //esto
              DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('admin')),
                    DropdownMenuItem(value: 'Junior', child: Text('Junior')),
                    DropdownMenuItem(value: 'dev', child: Text('dev')),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  }),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(child: const Text('Guardar')),
                  ),
                  onPressed: () {
                    //esto minimiza el teclado
                    FocusScope.of(context).requestFocus(FocusNode());
                    //esto verifica si hay valores introducidos en los inputs
                    if (!myFormKey.currentState!.validate()) {
                      print('formulario no valido');
                      return;
                    }
                    /**Imprime los valores del formuklario */
                    print(formValues);
                  })
            ],
          ),
        ),
      )),
    );
  }
}
