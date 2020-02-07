import 'package:flutter/material.dart';
import 'package:flutter_zodiac_signs/zodiac_list.dart';
import 'models/sign_model.dart';
import 'package:palette_generator/palette_generator.dart';

class ZodiacDetail extends StatefulWidget {
  int index;
  ZodiacDetail({this.index});

  @override
  _ZodiacDetailState createState() => _ZodiacDetailState();
}

class _ZodiacDetailState extends State<ZodiacDetail> {

  PaletteGenerator paletteGenerator;
  Sign selectedSign ;
  Color appColor;

  @override
  void initState() {
    super.initState();
    selectedSign=ZodiacList.allSigns[widget.index];
    findAppColor();
  }

  void findAppColor() {
    Future<PaletteGenerator> fPaletGenerator = PaletteGenerator
        .fromImageProvider(AssetImage(
        "images/"+selectedSign.signBigImage));

    fPaletGenerator.then((value) {
      paletteGenerator = value;

      setState(() {
        appColor = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appColor != null ? appColor : Colors.amber,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+selectedSign.signBigImage,
                fit: BoxFit.cover,
              ),
              title: Text(selectedSign.signName, style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,),),
              centerTitle: true,
              titlePadding: EdgeInsets.only(left: 100,right: 10),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(selectedSign.signDetail,style: TextStyle(fontSize: 18,),),
            ),
          ),
        ],
      ),
    );
  }
}
