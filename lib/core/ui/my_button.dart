import 'package:flutter/material.dart';
import 'package:login_escuro/core/resources/dimensions.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final bool loading;

  const MyButton({Key key, this.label, this.onTap, this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: loading
          ? Container(
              height: Dimensions.getConvertedHeightSize(context, 50),
              width: Dimensions.getConvertedWidthSize(context, 50),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            )
          : Text(label),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.purple.withOpacity(.5),
        ),
      ),
    );
  }
}
