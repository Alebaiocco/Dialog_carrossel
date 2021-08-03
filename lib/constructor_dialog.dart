import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'icons.dart';

class SlideIndex extends StatefulWidget {
  var index;
  SlideIndex(this.index);
  @override
  _SlideIndexState createState() => _SlideIndexState();
}

class _SlideIndexState extends State<SlideIndex> {
  final PageController _pageController = PageController(initialPage: 0);
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: slideList.length,
      itemBuilder: (ctx, i) => SlideItem(i),
    );
  }
}

class SlideItem extends StatefulWidget {
  late final int index;
  SlideItem(this.index);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding( padding: EdgeInsets.only(top: 15),
        child: SvgPicture.asset(slideList[index].imageUrl, width: 20, height: 20,),),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(slideList[index].description, textAlign: TextAlign.center,)
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),

      actions: [
        if(slideList[index] == slideList[slideList.length - 1])
          FlatButton(child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        else
          FlatButton(child: Text('Próximo'),
              onPressed: () {
                setState(() {
                  index++;
                });
              })
      ],);
  }
}

class Slide {
  final dynamic imageUrl;
  final dynamic description;

  Slide({this.imageUrl, this.description});
}

final slideList = [
  Slide(
    imageUrl: iconQrcode,
    description: 'Sucesso! seu dispositivo está conectado. Agora  ele está preparado para realizar os envios.',
  ),
  Slide(
    imageUrl: iconPlay,
    description: 'Clique no ícone acima para iniciar o envios de SMS deste aparelho.',
  ),
  Slide(
    imageUrl: iconArrow,
    description: 'Clique no ícone caso deseje pausar temporariamente os disparos deste aplicativo.',
  ),
  Slide(
    imageUrl: iconMquest,
    description: 'Ao decorrer dos seus envios estaremos informando a quantidade de mensagens efetuadas ou falhas relacionadas a este dispositivo',
  ),
  Slide(
    imageUrl: iconMclock,
    description: 'Se desejar encerrar a sessão deste aplicativo com a sua plataforma, clique no ícone para efetuar o desvinculo do aparelho.',
  ),
];