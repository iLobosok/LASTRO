import 'package:flutter/material.dart';

class MainGridList extends StatelessWidget {
  List<_Photo> _photos() {
    return [
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925558949-1.gif',
          title: 'Закон Снеллиуса',),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925558981-2.gif',
          title: 'Формула сферического зеркала',),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925558996-3.gif',
          title: 'Формула тонкой линзы',),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925558996-4.gif',
          title: 'Увеличение телескопа',
         ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925558996-5.gif',
          title: 'Угловое разрешение телескопа',
          ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559199-25.gif',
          title: 'Уравнение Мещерского',
          ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559215-26.gif',
          title: 'Формула Циолковского',
         ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559106-18.gif',
          title: 'Энергия в поле тяжести',
          ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559106-17.gif',
          title: 'Кинетическая энергия',
),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559059-14.gif',
          title: 'Эффект замедления времени',
         ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559012-10.gif',
          title: 'Закон всемирного тяготения',
          ),
      _Photo(imageURL: 'https://www.calc.ru/pic/63103925559012-8.gif',
          title: 'Продольный эффект Доплера',
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(right:20.0,left:20.0),
        child: GridView.count(crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(2),
            childAspectRatio: 1,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children:_photos().map<Widget>( (photo) {
              return _GridDemoPhotoItem(
                photo: photo,
              );
            }).toList()),
      ),
    );
  }
}

class _Photo {
  _Photo({
    this.imageURL,
    this.title,
    this.subtitle,
  });

  final String imageURL;
  final String title;
  final String subtitle;
}

class GridSubject extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
    Center(
      child:Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text('Формулы',
            style: TextStyle(fontFamily: 'ConcertOne-Regular',
                fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
      );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(photo.imageURL,
        fit: BoxFit.fill,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
        ),
      ),
      child: image,
    );
  }}