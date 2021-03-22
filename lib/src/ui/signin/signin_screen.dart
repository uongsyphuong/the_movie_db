import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_movie_db/src/ui/customView/raise_button.dart';
import 'package:the_movie_db/src/ui/customView/scroll_view_height.dart';
import 'package:the_movie_db/src/ui/customView/text_input.dart';
import 'package:the_movie_db/src/ui/forgotPass/forgot_pass_screen.dart';
import 'package:the_movie_db/src/ui/signup/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollViewWithHeight(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64,
              ),
              Center(
                  child: Image.asset(
                "assets/logo_large.png",
                width: 200,
              )),
              SizedBox(
                height: 42,
              ),
              Text(
                "Đăng nhập vào tài khoản",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(
                  title: "Email", textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(
                title: "Mật khẩu",
                isPassword: true,
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                    text: "Quên mật khẩu?",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ForgotPassScreen()));
                      },
                    style: TextStyle(
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -2))
                      ],
                      color: Colors.transparent,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      fontSize: 14,
                    )),
              ),
              SizedBox(
                height: 36,
              ),
              RaisedGradientButton(
                  child: Text(
                    'Đăng nhập'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xA3019E84), Color(0xFF019E84)],
                  ),
                  onPressed: () {
                    print('button clicked');
                  }),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Bạn chưa có tài khoản? ",
                      ),
                      TextSpan(
                          text: "Đăng ký",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF019E84),
                            color: Color(0xFF019E84),
                            fontSize: 14,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
