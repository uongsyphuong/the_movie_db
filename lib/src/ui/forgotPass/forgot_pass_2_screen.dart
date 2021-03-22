import 'package:flutter/material.dart';
import 'package:the_movie_db/src/ui/customView/raise_button.dart';
import 'package:the_movie_db/src/ui/customView/scroll_view_height.dart';
import 'package:the_movie_db/src/ui/customView/text_input.dart';

class ForgotPass2Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPass2ScreenState();
  }
}

class _ForgotPass2ScreenState extends State<ForgotPass2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Quên mật khẩu"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ScrollViewWithHeight(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Mã xác thực đã được gửi đến email của bạn\nNhập mã xác thực bên dưới và đặt lại mật khẩu"),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(title: "Mã xác thực"),
              SizedBox(
                height: 24,
              ),
              Text("Vui lòng nhập mật khẩu mới cho tài khoản."),
              SizedBox(
                height: 8,
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
              Spacer(),
              RaisedGradientButton(
                  child: Text(
                    'Đặt mật khẩu mới'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xA3019E84), Color(0xFF019E84)],
                  ),
                  onPressed: () {
                    print('button clicked');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
