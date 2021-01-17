import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'constants.dart';
import 'package:flutter/animation.dart';

int position = 0;

class stars extends StatefulWidget {
  @override
  Star createState() => Star();
}

class Star extends State<stars> {
  List<String> imageList = [
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Sozvezdie-Gerkules.png',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Sozvezdie-Pegasa.png',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Zvyozdy-Pegasa.gif',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Sozvezdie-Kassiopeya-1.png',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Sozvezdie-Kassiopeya-zvezdy.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2020/06/Zvyozdy-sozvezdiya-Deva.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Sozvezdie-TSentavra.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Alfa-TSentavra.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2019/08/Tumannost-NGC-3918.png',
    'https://kosmosgid.ru/wp-content/uploads/2019/11/Polyarnaya-Zvezda.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2019/11/Zvyozdy-TSefeya.png',
    'https://kosmosgid.ru/wp-content/uploads/2019/11/Galaktika-Golovastik.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2020/03/galaktika-Koleso-Telegi.jpg',
    //'https://kosmosgid.ru/wp-content/uploads/2020/06/Strelets.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2020/08/Malyj-Kon1.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2020/05/Zvyozdy-sozvezdiya-Vodolej.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2020/05/Messe-2.jpg',
    'https://kosmosgid.ru/wp-content/uploads/2020/05/Sozvezdie-Malyj-Lev.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: starsColor,
      body: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [starsColor, starsColorend],
                stops: [0.3, 0.7])),
        margin: EdgeInsets.only(left: 0, right: 0),
        child: new StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child:InkWell(
                  onTap: (){
                    position = index;
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FullScreenPage();
                    }));
                  },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage, image: imageList[index],fit: BoxFit.cover,),
                ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            }),
      ),
    );
  }
}
class FullScreenPage extends StatelessWidget {
  get imageList => Star().imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(imageList[position]),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }
}