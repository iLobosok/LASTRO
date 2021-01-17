import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_universe/constants.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_universe/ad_manager.dart';

class SecondActivity extends StatefulWidget {
  @override
  Second createState() => Second();
}

// DateTime now = DateTime.now();
// String DateToPrint = DateFormat('dd-MM').format(now);
// double rightnow = DateFormat.Hm() as double;
String text_time = "Выберете опцию";

var temp = DateTime.now().toUtc().toLocal();
var d1 = DateTime.utc(temp.hour);

class datas {
  get rightnow => d1;

  void decide() {
    if (rightnow > 4) {
      text_time = "Доброе утро!";
    }
    else if  (rightnow > 11) {
      text_time = "Добрый день!";
    }
    else if (rightnow > 16) {
      text_time = "Добрый вечер";
    }
    else {
      text_time = "Выберете опцию";
    }
  }
}
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text('Done!'),
    backgroundColor: Colors.lightGreen,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
        label: 'Done',
        textColor: Colors.white,
        onPressed: () {
          print('Done pressed!');
        }),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}


class Second extends State<SecondActivity> {
  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    datas();
    return Scaffold(
        backgroundColor: start,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                    child: Text(
                      "LASTRO \n $text_time",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 25,
                          width: SizeConfig.blockSizeHorizontal * 40,
                          child: InkWell(
                              child: Card(
                                color: bottom,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0)
                                ),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/planets.png", width: 64.0,),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Планеты",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/main');
                              }
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 25,
                          width: SizeConfig.blockSizeHorizontal * 40,
                          child: InkWell(
                            child: Card(

                              color: bottom,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)
                              ),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/stars.png", width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Созвездия",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),

                                      ],
                                    ),
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/second');
                            },
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 25,
                          width: SizeConfig.blockSizeHorizontal * 40,
                          child: InkWell(
                            child: Card(
                              color: bottom,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)
                              ),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/math.png", width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Формулы",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/math');
                            },
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 25,
                          width: SizeConfig.blockSizeHorizontal * 40,
                          child: InkWell(
                            child: Card(
                              color: bottom,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)
                              ),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/faq.png", width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Факты",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/faq');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }

  Future<void> _initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  BannerAd _bannerAd;

  // TODO: Implement _loadBannerAd()
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.top);
  }

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
