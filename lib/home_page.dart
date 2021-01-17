import 'dart:ui';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_universe/ad_manager.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universe/detail_page.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'data.dart';

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

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  var dropval;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                  ],
                ),
              ),
              Expanded(
                child:Container(
                  height: 500,
                  padding: const EdgeInsets.only(left: 32),
                  child: Swiper(
                    itemCount: planets.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,

                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                planetInfo: planets[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: SizeConfig.blockSizeVertical * 15),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: SizeConfig.blockSizeVertical * 12),
                                        Center(
                                        child:Text(
                                          planets[index].name,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: ResponsiveFlutter.of(context).fontSize(3),
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        ),
                                        SizedBox(height: 32),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Читать',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Hero(
                              tag: planets[index].position,
                              child: Image.asset(planets[index].iconImage),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
