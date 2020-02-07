import 'package:flutter/material.dart';
import 'package:flutter_zodiac_signs/zodiac_detail.dart';
import 'models/sign_model.dart';
import 'utils/strings.dart';

class ZodiacList extends StatelessWidget {
  List<Sign> allSigns;

  @override
  Widget build(BuildContext context) {
    allSigns = getReadyToData();

    return Scaffold(
      appBar: AppBar(
        title: Text("Zodiac Signs"),
      ),
      body: getReadyToList(),
    );
  }

  List<Sign> getReadyToData() {
    List<Sign> signs = [];

    for (int i = 0; i < 12; i++) {
      String smallImage = Strings.SIGN_NAME[i].toLowerCase() + "${i + 1}.png";
      String bigImage =
          Strings.SIGN_NAME[i].toLowerCase() + "_big" + "${i + 1}.png";

      Sign addingSign = Sign(Strings.SIGN_NAME[i], Strings.SIGN_DATES[i],
          Strings.SIGN_GENERAL_DETAILS[i], smallImage, bigImage);
      signs.add(addingSign);
    }

    return signs;
  }

  Widget getReadyToList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return oneLineSign(context, index);
      },
      itemCount: allSigns.length,
    );
  }

  Widget oneLineSign(BuildContext context, int index) {
    Sign addinglistSign = allSigns[index];

    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ZodiacDetail(
                        index: index,
                      )));
        },
        leading: Image.asset("images/" + addinglistSign.signSmallImage),
        title: Text(addinglistSign.signName),
        subtitle: Text(addinglistSign.signDate),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
