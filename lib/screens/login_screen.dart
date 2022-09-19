
import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:fl_cliente_mediacion/ui/ui.dart';
import 'package:fl_cliente_mediacion/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        ChangeNotifierProvider(
                          create: (context) => LoginProvider(),
                          child: _FormularioLogin()                        ,
                          )                        
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text('Registrese', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                const SizedBox(height: 300,)
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
    final loginProvider = Provider.of<LoginProvider>(context);
    
    return Form(
      key: loginProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              onChanged: (value) => loginProvider.correo = value,              
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:  InputDecorations.customInputDecoration(labelText: "correo electrónico", hint_text: "john.doe@gmail.com", prefixIcon: Icons.alternate_email_sharp),
              validator: (value){
               return ValidateTExtFormField.validateEmail(value);
              }              
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              onChanged: (value) => loginProvider.password = value,
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration:  InputDecorations.customInputDecoration(labelText: "clave", hint_text: "password", prefixIcon: Icons.password),
              validator: (value) => ValidateTExtFormField.validatePassword(value),
            ),
          ),
          SizedBox(height: 30,),
          MaterialButton(
            onPressed: (){
              if (!loginProvider.isValidForm()) return;
              Navigator.pushReplacementNamed(context, 'home');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Text('Ingresar', style: TextStyle(color: Colors.white),),
            ),
            color: Color(0xff94273E),

            )
        ],
      )
      );
  }
}