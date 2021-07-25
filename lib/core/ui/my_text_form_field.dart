import 'package:flutter/material.dart';
import 'package:login_escuro/core/resources/dimensions.dart';

class MyTextFormField extends StatefulWidget {
  final String hint;
  final Function onChanged;
  final TextEditingController controller;
  final Function validator;
  final bool obscureText;

  const MyTextFormField(
      {Key key,
      this.hint = '',
      this.onChanged,
      this.controller,
      this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
        fontSize: Dimensions.getTextSize(context, 35),
      ),
      validator: widget.validator,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.getTextSize(context, 35),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: Dimensions.getConvertedWidthSize(context, 1),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: Dimensions.getConvertedWidthSize(context, 1),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: Dimensions.getConvertedWidthSize(context, 1),
          ),
        ),
      ),
    );
  }
}
