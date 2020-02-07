import 'package:flutter/material.dart';

import 'utils/strings.dart';

class ZodiacDetail extends StatelessWidget {
  int index;

  ZodiacDetail({this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(Strings.SIGN_NAME[index]),
            expandedHeight: 150,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/${Strings.SIGN_NAME[index].toLowerCase()}_big${index+1}.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(sliverChild()))
        ],
      ),
    );
  }

  List<Widget> sliverChild() {
    return [
      Card(
        elevation: 8,
        child: Text(Strings.SIGN_GENERAL_DETAILS[index]),
      ),
    ];
  }
}
