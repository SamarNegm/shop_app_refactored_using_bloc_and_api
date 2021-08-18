import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/models/onBoardingModel.dart';
import 'package:flutter_shop_app_refactored/network/local/cache_helper.dart';
import 'package:flutter_shop_app_refactored/screens/auth/auth_screen.dart';
import 'package:flutter_shop_app_refactored/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key key}) : super(key: key);
  final controller = PageController(viewportFraction: 0.8);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> models = [
      OnBoardingModel(
          image: AssetImage('assets/images/chose.png'),
          title: 'Choose Your Products',
          description: 'Pla Pla Pla Pla'),
      OnBoardingModel(
          image: AssetImage('assets/images/payment.png'),
          title: 'Choose The Payment Method',
          description: 'Pla Pla Pla Pla'),
      OnBoardingModel(
          image: AssetImage('assets/images/delivary.png'),
          title: 'Delever Your Product',
          description: 'Pla Pla Pla Pla'),
    ];
    print('onboarding');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'isFirst', value: false).then(
                    (value) => Navigator.of(context)
                        .pushReplacementNamed(AuthScreen.routeName));
              },
              child: Text(
                'SKIP',
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
              onPageChanged: (index) {
                currentIndex = index;
              },
              controller: controller,
              itemBuilder: (context, index) => PageViweItem(models[index]),
              itemCount: models.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
          SmoothPageIndicator(
              controller: controller,
              count: models.length,
              effect: ScrollingDotsEffect(
                dotColor: Theme.of(context).accentColor,
                activeStrokeWidth: 2.6,
                activeDotScale: .4,
                radius: 8,
                spacing: 10,
              )),
          SizedBox(height: 20)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: defultColor,
        child: Icon(Icons.chevron_right_sharp, color: thierdltColor),
        onPressed: () {
          print(currentIndex.toString() + '  ' + models.length.toString());
          if (currentIndex == models.length - 1) {
            CacheHelper.saveData(key: 'isFirst', value: false).then((value) =>
                Navigator.of(context)
                    .pushReplacementNamed(AuthScreen.routeName));
          }

          controller.nextPage(
              duration: Duration(milliseconds: 50),
              curve: Curves.fastLinearToSlowEaseIn);
        },
      ),
    );
  }

  Widget PageViweItem(OnBoardingModel model) {
    return Column(
      children: [
        Container(
            height: 400,
            child: Image(
              image: model.image,
            )),
        SizedBox(
          height: 20,
        ),
        Text(model.title,
            style: TextStyle(
                color: thierdltColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 20,
        ),
        Text(
          model.description,
          style: TextStyle(color: thierdltColor, fontSize: 18),
        ),
      ],
    );
  }
}
