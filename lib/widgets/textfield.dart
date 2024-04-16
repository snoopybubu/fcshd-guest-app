import 'package:flutter/material.dart';
import 'package:get/get.dart';

class textfield extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final TextInputType myKeyboard;
  String? Function(String?)? validatorFunction;
  var suffix;
  var prefix;
  final RxBool obscure;
  textfield(
      {required this.hintText,
      required this.myController,
      required this.myKeyboard,
      this.suffix,
      this.prefix,
      required this.validatorFunction,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        validator: validatorFunction,
        obscureText: obscure.value,
        controller: myController,
        keyboardType: myKeyboard,
        decoration: InputDecoration(
          
          filled: true,
          fillColor: Colors.white70,
          prefixIcon: prefix,
          prefixIconColor:Colors.yellow,
          suffixIcon: suffix,
          
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400),

          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.yellow[50]!), borderRadius: const BorderRadius.all(Radius.circular(30)) ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.yellow[50]!), borderRadius: const BorderRadius.all(Radius.circular(30)) ),
          

          // enabledBorder: const UnderlineInputBorder(
          //     borderSide: BorderSide(color: Colors.grey),
          //     borderRadius: BorderRadius.all(Radius.circular(10)))
        ),
      ),
    );
  }
}
