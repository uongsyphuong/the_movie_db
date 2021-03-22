import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height / 2 - 16,
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Text(desc,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
          )
        ],
      ),
    );
  }
}

class SlideFirstTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideFirstTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 64,
        ),
        Image.asset(
          imagePath,
          height: MediaQuery.of(context).size.height / 2 - 16,
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              "Chúng tôi là ",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            Image.asset(
              "assets/logo.png",
              width: 103,
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text(desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16))
      ],
    );
  }
}

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Trợ lý vườn thông minh của bạn");
  sliderModel.setTitle("Chào bạn!");
  sliderModel.setImageAssetPath("assets/onboarding_1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Tận hưởng nguồn nông sản sạch và tươi ngon do chính tay mình chăm sóc");
  sliderModel
      .setTitle("Chúng tôi sẽ giúp bạn sở hữu một vườn rau thông minh tại nhà");
  sliderModel.setImageAssetPath("assets/onboarding_2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Nâng cao năng suất và tiết kiệm thời gian");
  sliderModel
      .setTitle("Giúp bạn quản lý và chăm sóc cây trồng theo thời gian thực");
  sliderModel.setImageAssetPath("assets/onboarding_3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Chia sẻ kinh nghiệm và cùng FarmerBox phát triển những dự án cộng đồng");
  sliderModel.setTitle("Và tạo nên những giá trị lan tỏa, kết nối cộng đồng.");
  sliderModel.setImageAssetPath("assets/onboarding_4.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
