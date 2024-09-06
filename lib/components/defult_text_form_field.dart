import 'package:flutter/material.dart';
//import 'package:list_view_proj/views/first_screen.dart'

TextFormField buildTextFormField(
    {required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    required String? labelText,
    bool isObsecure = false,
    IconButton? suffixIcon}) {
  return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObsecure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: labelText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ));
}
