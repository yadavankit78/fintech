
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller ;
  final String hintText ;
  final bool isFill ;
  final String label ;
  final Widget? prefix;
  final String? Function(String?)? validator ;
  final String? Function(String?)? onChanged ;
  final double padding ;
  final bool isReadOnly ;
  final Widget? suffix ;
  final InputBorder? border ;
  final InputBorder? focusedBorder ;
  final TextInputType? textInputType ;
  const CustomTextFormField({super.key,
    this.onChanged ,
    this.border ,
    this.focusedBorder ,
    this.suffix ,
    this.prefix ,
    this.isFill = false ,
    this.label = '' ,
    this.textInputType ,
    this.padding = 16,
    this.isReadOnly = false ,
    required this.controller, required this.hintText,  this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (newValue) {

      },
      onChanged: onChanged,
      keyboardType:textInputType ,
      validator: validator,
      decoration: const InputDecoration().copyWith(
        border: border ,
        focusedBorder:focusedBorder ,
        prefixIcon:prefix ,
        contentPadding: EdgeInsets.symmetric(horizontal: padding),
        filled: isFill ,
        labelText: label ,
        suffixIcon: suffix ,
      ),
      controller: controller ,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },


    );
  }
}
