

import 'package:fl_cliente_mediacion/ui/input_decorations.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static String route = "register";

  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: heightOfScreen * 0.15,),
              Expanded(
                child: Center(
                  child: ListView(
                    children: [
                      Text('Formulario de Registro',textAlign: TextAlign.center, style: textTheme.headline1,),
                      SizedBox(height: 20,),
                      _FormularioRegistro()

                    ],
                  ),
                ),
              )
            ],
          ),
        )
        )
    );
  }
}






class _FormularioRegistro extends StatelessWidget {
  const _FormularioRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    //final loginProvider = Provider.of<LoginProvider>(context);
    var widthOfScreen = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        Row(
          children: [
            Container(
                  width: widthOfScreen/2,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    //onChanged: (value) => loginProvider.password = value,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration:  InputDecorations.roundedInputDecoration(labelText: "Apellido", hint_text: "apellido", prefixIcon: Icons.abc),
                    //validator: (value) => ValidateTExtFormField.validatePassword(value),
                  ),
                ),    
          ],
        )


//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: TextFormField(
//               onChanged: (value) => loginProvider.correo = value,              
//               autocorrect: false,
//               keyboardType: TextInputType.emailAddress,
//               decoration:  InputDecorations.customInputDecoration(labelText: "correo electrónico", hint_text: "john.doe@gmail.com", prefixIcon: Icons.alternate_email_sharp),
//               validator: (value){
//                return ValidateTExtFormField.validateEmail(value);
//               }              
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: TextFormField(
//               //onChanged: (value) => loginProvider.password = value,
//               autocorrect: false,
//               keyboardType: TextInputType.visiblePassword,
//               obscureText: true,
//               decoration:  InputDecorations.customInputDecoration(labelText: "clave", hint_text: "password", prefixIcon: Icons.password),
//               validator: (value) => ValidateTExtFormField.validatePassword(value),
//             ),
//           ),
//           SizedBox(height: 30,),
//           MaterialButton(
//             onPressed: (){
//               if (!loginProvider.isValidForm()) return;
//               Navigator.pushReplacementNamed(context, 'home');
//             },
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)
//             ),
//             disabledColor: Colors.grey,
//             elevation: 0,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
//               child:  Text('Ingresar', style: TextStyle(color: Colors.white),),
//             ),
//             color: Color(0xff94273E),

//             )
      ],
    );
  }
 }