import 'package:flutter/material.dart';
import 'package:login_escuro/core/resources/dimensions.dart';
import 'package:login_escuro/core/resources/images.dart';
import 'package:login_escuro/core/resources/strings.dart';
import 'package:login_escuro/core/ui/my_button.dart';
import 'package:login_escuro/core/ui/my_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final Map<String, String> _formData = Map<String, String>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: _formData['EMAIL']);
    _passwordController = TextEditingController(text: _formData['PASSWORD']);
  }

  void _formValidate() {
    if (_key.currentState.validate()) {
      setState(() {
        loading = true;
      });
    } else {
      setState(() {
        loading = false;
      });
      return;
    }
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff280140),
        // Top wave image
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.contain,
          image: AssetImage(
            Images.login_topo_wave,
          ),
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              Dimensions.getEdgeInsets(context, top: 450, left: 80, right: 80),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Page title
                Text(
                  Strings.hello_here_title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.getTextSize(context, 50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Strings.welcome_back_title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.getTextSize(context, 50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 150),
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      MyTextFormField(
                        onChanged: (value) {
                          _formData['EMAIL'] = value;
                        },
                        hint: Strings.login_email_hint,
                        controller: _emailController,
                        validator: (text) {
                          if (text.isEmpty) {
                            return Strings.login_fill_email_message;
                          } else if (!text.contains('@')) {
                            return Strings.login_invalid_email_message;
                          } else {
                            return null;
                          }
                        },
                      ),
                      MyTextFormField(
                        onChanged: (value) {
                          _formData['PASSWORD'] = value;
                        },
                        obscureText: true,
                        hint: Strings.login_password_hint,
                        controller: _passwordController,
                        validator: (text) {
                          if (text.length < 8) {
                            return Strings.minimum_length_message;
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(context, 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Dimensions.getConvertedHeightSize(context, 120),
                      width: Dimensions.getConvertedWidthSize(
                          context, loading ? 120 : 350),
                      child: MyButton(
                        label: Strings.login_label,
                        onTap: _formValidate,
                        loading: loading,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}
