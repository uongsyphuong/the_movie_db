import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/src/ui/customView/raise_button.dart';
import 'package:the_movie_db/src/ui/customView/scroll_view_height.dart';
import 'package:the_movie_db/src/ui/customView/text_input.dart';
import 'package:the_movie_db/src/ui/forgotPass/forgot_pass_2_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPassScreenState();
  }
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
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
              Text("Nhập email để khôi phục"),
              SizedBox(
                height: 16,
              ),
              TextInputWidget(
                hasTitle: false,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "*Mã xác thực sẽ được gửi đến email của bạn",
                style: TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RaisedGradientButton(
                    child: Text(
                      'Gửi mã xác nhận'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xA3019E84), Color(0xFF019E84)],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return ForgotPass2Screen();
                      }));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
