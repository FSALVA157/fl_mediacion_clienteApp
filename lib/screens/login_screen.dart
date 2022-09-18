
import 'package:fl_cliente_mediacion/widget/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  static const route = "login";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: BackgroundLogin(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 150,),
                CardContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Text("Login", style: Theme.of(context).textTheme.headline4,),
                        const SizedBox(height: 30,),
                        _FormularioLogin()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
         ),
    );
  }
}


class _FormularioLogin extends StatelessWidget {
  const _FormularioLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            decoration: const InputDecoration(
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff94273E)                  
              )
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff94273E),
                width: 2
              )
            ),
            label: Text('correo electrónico'),
            hintText: "maria.eva@gmail.com",
            labelStyle: TextStyle(
              color: Colors.grey
            ),
            prefixIcon: Icon(Icons.alternate_email_sharp, color: Color(0xff94273E),)
            ),
            keyboardType: TextInputType.emailAddress            
          )
        ],
      )
      );
  }
}