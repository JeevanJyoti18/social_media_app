import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/sign_in_screen";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  String _email = "";
  String _password = "";

  late final FocusNode _passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  void _sumbit() {
    FocusScope.of(context).unfocus();

    if(!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    // TODO:- AUthenticate With Email AND Pasword
    // If Verified Go to Poats Screen
    // TODO:-  add email verification
  }


  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }


  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(

                children: [
                  // E MAIL
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),

                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Enter Email"
                    ) ,

                    validator: (value) {

                      if(value != null &&  value.isNotEmpty){
                        return"Please Provide Email...";
                      }

                      if(value!.length < 5){
                        return"Please Provide A Longer Email...";
                      }
                      return null;

                    },

                  ),


                  //PASSWORD
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    obscureText: false,
                    textInputAction: TextInputAction.done,
                    onSaved: (value) {
                      _password = value!.trim();
                    },

                    onFieldSubmitted: (_) {
                      // TODO:- Sumbit Form

                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Enter Password"
                    ),
                    validator: (value) {

                      if(value != null &&  value.isNotEmpty){
                        return"Please Provide Password...";
                      }

                      if(value!.length < 5){
                        return"Please Provide A Longer Password...";
                      }
                      return null;

                    },

                  ),

                  ElevatedButton(
                    onPressed: (){
                    // TODO:-SUMBIT FORM AND AUTHENTICATE WITH email AND password
                  },
                    child: const Text("Log In"),
                  ),


                  TextButton(
                    onPressed: (){
                    // TODO:- GO TO signup() screen
                  },
                    child: const Text("Sign Up Instead"),
                  ),

                ],

              ),
            ),
          ),
        )
      )

    );
  }
}
