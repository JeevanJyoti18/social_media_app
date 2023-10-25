import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/sign_up_screen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email = "";
  String _username = "";
  String _password = "";

  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    // TODO: Authenticate SignUp With Email AND Password
    // TODO: Send Email to Verify
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _email = value!.trim();
                },
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_usernameFocusNode),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: "Enter Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Provide Email...";
                  }

                  if (value.length < 5) {
                    return "Please Provide A Longer Email...";
                  }
                  return null;
                },
              ),

              // Username
              TextFormField(
                focusNode: _usernameFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_passwordFocusNode),
                onSaved: (value) {
                  _username = value!.trim();
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: "Enter Username",
                ),
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Provide Username...";
                  }

                  if (value.length < 5) {
                    return "Please Provide A Longer Username...";
                  }
                  return null;
                },
              ),

              // Password
              TextFormField(
                focusNode: _passwordFocusNode,
                textInputAction: TextInputAction.done,
                obscureText: true,
                onFieldSubmitted: (_) => _submit(),
                onSaved: (value) {
                  _password = value!.trim();
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: "Enter Password",
                ),
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Provide Password...";
                  }

                  if (value.length < 5) {
                    return "Please Provide A Longer Password...";
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: _submit,
                child: const Text("Sign Up"),
              ),

              TextButton(
                onPressed: () {
                  // TODO: Go to Sign In Screen
                },
                child: const Text("Sign In Instead"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
