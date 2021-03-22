import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/src/ui/customView/raise_button.dart';
import 'package:the_movie_db/src/ui/customView/scroll_view_height.dart';
import 'package:the_movie_db/src/ui/customView/text_input.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: MediaQuery.of(context).size.width / 3,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.arrow_back_ios), Text("Quay lại")],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
    return Scaffold(
      appBar: appbar,
      backgroundColor: Colors.white,
      body: ScrollViewWithHeight(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 64 - appbar.preferredSize.height,
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
                "Đăng ký tài khoản mới",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(title: "Tên tài khoản"),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(
                title: "Email",
              ),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(title: "Số điện thoại"),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(
                title: "Mật khẩu",
                isPassword: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(
                title: "Nhập lại mật khẩu",
                isPassword: true,
              ),
              SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                    text: "Quên mật khẩu?",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("forgot pass");
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
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                        text: "Bạn chưa có tài khoản? ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Đăng ký",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("click");
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
            ],
          ),
        ),
      ),
    );
  }
}
