import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/src/ui/onboarding/slide_tile.dart';
import 'package:the_movie_db/src/ui/signin/signin_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> mySlide = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 12.0 : 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xff019E84) : Color(0x4d019E84),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySlide = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 14 * MediaQuery.of(context).size.height / 15,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideFirstTile(
                    imagePath: mySlide[0].getImageAssetPath(),
                    title: mySlide[0].getTitle(),
                    desc: mySlide[0].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySlide[1].getImageAssetPath(),
                    title: mySlide[1].getTitle(),
                    desc: mySlide[1].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySlide[2].getImageAssetPath(),
                    title: mySlide[2].getTitle(),
                    desc: mySlide[2].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySlide[3].getImageAssetPath(),
                    title: mySlide[3].getTitle(),
                    desc: mySlide[3].getDesc(),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      controller.animateToPage(3,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: slideIndex == 3
                        ? null
                        : Text(
                            "Bỏ qua".toUpperCase(),
                            style: TextStyle(
                                color: Color(0xff9E9E9E),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: slideIndex != 3
                        ? () {
                            controller.animateToPage(slideIndex + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          }
                        : () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                    child: Text(
                      slideIndex == 3
                          ? "Bắt đầu".toUpperCase()
                          : "Tiếp tục".toUpperCase(),
                      style: TextStyle(
                          color: Color(0xff019E84),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
