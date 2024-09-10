import 'package:flutter/material.dart';

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
        hintStyle: const TextStyle(fontSize: 14,color: Color(0xFF868686)),
        hintText: labelText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ));
}
