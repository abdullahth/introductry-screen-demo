import 'package:flutter/material.dart';

import 'components/paints/desc_paint/desc_paint.dart';
import 'components/widgets/auth_sheet/auth_sheet.dart';
import 'components/widgets/indicators/indicators.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final images = <ImageProvider>[
    const NetworkImage(
        'https://img.freepik.com/free-vector/natural-landscape-wallpaper-video-conferencing_23-2148651571.jpg?size=626&ext=jpg&ga=GA1.2.1357081606.1639008000'),
    const NetworkImage(
        'https://3.bp.blogspot.com/-rHGW-Pj086E/XJqrXq3DJlI/AAAAAAAABB0/kRGUxP_OqkUmicF3bW129ubAa0myCJs9ACKgBGAs/w1920-h1200-c/sunset-horizon-scenery-landscape-art-uhdpaper.com-4K-178.jpg'),
    const NetworkImage(
        'https://c4.wallpaperflare.com/wallpaper/163/719/689/digital-art-landscape-forest-lagoon-wallpaper-preview.jpg')
  ];

  late int currentImageIndex;
  late bool expandAuthSheet;
  @override
  void initState() {
    currentImageIndex = 0;
    expandAuthSheet = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          child: Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                width: deviceSize.width,
                height: deviceSize.height * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: images[currentImageIndex]))),
          ),
        ),
        Positioned(
          bottom: deviceSize.height * 0.1,
          child: SizedBox(
              width: deviceSize.width,
              height: deviceSize.height * 0.7,
              child: CustomPaint(
                size: Size(deviceSize.width, deviceSize.height * 0.7),
                painter: IntroductionDescriptionPaint(),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: deviceSize.height * 0.1),
                    width: deviceSize.width * 0.8,
                    height: deviceSize.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text('Lorem Ispum',
                            style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 32,
                                fontWeight: FontWeight.w800)),
                        const Spacer(),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id lorem quis turpis rhoncus dapibus. Proin facilisis vel massa eget bibendum. Mauris eget tellus ut purus euismod sodales ut condimentum diam. Duis consequat quis diam vel varius. In tempor hendrerit mollis. Suspendisse vulputate blandit eleifend. Sed porttitor, velit vitae finibus accumsan, est est vehicula risus, at suscipit urna mauris sit amet purus. Nullam imperdiet semper orci sed tempor. Sed nec ultricies turpis. In pellentesque vulputate sem nec suscipit. Duis mauris ex, lacinia nec dui sed, tristique tempor odio. Nulla in mauris massa. Maecenas volutpat nisl sed vehicula pulvinar. Nullam varius ac urna ac lobortis.Cras in lectus lacus. Quisque at malesuada neque. Pellentesque id nibh velit. Ut ex massa, sagittis a nunc non, ultrices pretium libero. Pellentesque ullamcorper arcu sit amet tortor ornare, eget malesuada dui vehicula. Duis viverra est at lacus pharetra, id dapibus arcu laoreet. Ut dapibus ut purus sit amet consequat. Sed auctor posuere nunc, nec sagittis felis volutpat id. Nam sed odio sagittis justo elementum bibendum nec sed est. Nulla nec pellentesque libero. Morbi finibus arcu quis nibh convallis, eget pharetra neque fringilla. Sed ultrices sem non sem posuere elementum. Praesent sed neque convallis, mollis nibh ut, ultrices odio. Cras lacinia justo tortor, sit amet ullamcorper ligula rhoncus id.'
                              .substring(0, 750),
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                              fontWeight: FontWeight.w100),
                        ),
                        const Spacer(),
                        CustomPageIndicators(
                            maxPages: 3,
                            currentIndex: currentImageIndex,
                            onChangeCallback: (v) {
                              setState(() {
                                currentImageIndex = v;
                              });
                            }),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              )),
        ),
        Positioned(
          right: 12,
          child: SizedBox(
            width: 32,
            height: 32,
            child: Center(
              child: InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {},
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          top: expandAuthSheet
              ? deviceSize.height * 0.8
              : deviceSize.height * 0.225,
          child: AuthSheet(
              isExpanded: expandAuthSheet,
              expandCallback: () {
                setState(() {
                  expandAuthSheet = !expandAuthSheet;
                });
              }),
        )
      ],
    ));
  }
}
