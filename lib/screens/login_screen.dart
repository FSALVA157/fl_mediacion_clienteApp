
import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:fl_cliente_mediacion/screens/screens.dart';
import 'package:fl_cliente_mediacion/services/auth_service_provider.dart';
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
                        _FormularioLogin()
                        // ChangeNotifierProvider(
                        //   create: (context) => LoginProvider(),
                          // child: _FormularioLogin()                        ,
                          // )                        
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width /2,
                  child: CustomMaterialButton(
                    elevation: 0,
                    color: Colors.transparent,
                    borderRadius: 20,
                    title: "Registrese",
                    onPressed: (){
                      Navigator.pushNamed(context, RegisterScreen.route);
                    }, 
                    textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontSize: 30)),
                ),
                // const Text('Registrese', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
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
    final authServiceProvider = Provider.of<AuthServiceProvider>(context);
    
    return Form(
      key: loginProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              onChanged: (value) => loginProvider.dni = value,              
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration:  InputDecorations.customInputDecoration(labelText: "dni", hint_text: "36258741", prefixIcon: Icons.account_box_rounded),
              // validator: (value){
              //  return ValidateTExtFormField.validateEmail(value);
              // }              
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
              // validator: (value) => ValidateTExtFormField.validatePassword(value),
            ),
          ),
          SizedBox(height: 30,),
          MaterialButton(
            onPressed: () async{
              print(loginProvider.dni);
              print(loginProvider.password);
              Map<String, dynamic> data = await authServiceProvider.loginUser(
                                  loginProvider.dni,
                                  loginProvider.password);
              print(data);

              // if (!loginProvider.isValidForm()) return;
              // Navigator.pushReplacementNamed(context, 'home');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child:  Text('Ingresar', style: TextStyle(color: Colors.white),),
            ),
            color: Color(0xff94273E),

            )
        ],
      )
      );
  }
}