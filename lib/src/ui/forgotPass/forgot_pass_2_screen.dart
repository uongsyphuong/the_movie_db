import 'dart:async';

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
  Timer _timer;
  int _start = 120;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
              Stack(
                children: [
                  TextInputWidget(title: "Mã xác thực"),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: _start == 0
                            ? Text("Gửi lại mã",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF019E84),
                                    decoration: TextDecoration.underline))
                            : Text(
                                "Gửi lại mã (${_start}s)",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9E9E9E),
                                    decoration: TextDecoration.underline),
                              )),
                  )
                ],
              ),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedGradientButton(
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
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
