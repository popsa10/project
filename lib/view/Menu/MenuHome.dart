import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardG = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardK = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                close(),
                expansionTileCard(
                    key: cardA,
                    text: "hr",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardB,
                    text: "Project",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardC,
                    text: "Mangement",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardD,
                    text: "hr",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardE,
                    text: "hr",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardF,
                    text: "kcjdncjsdn",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardG,
                    text: "kcjdncjsdn",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
                expansionTileCard(
                    key: cardK,
                    text: "kcjdncjsdn",
                    image: "assets/images/Group 69796.png",
                    widget: Column(
                      children: [
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                        columnTitle(
                            titleImage: "assets/images/Group 69796.png",
                            titleText: "Loction"),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget close() => Padding(
        padding: EdgeInsets.only(
          top: 15,
          right: 3,
        ),
        child: Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
        ),
      );

  Widget expansionTileCard(
          {String text, String image, Widget widget, Key key}) =>
      Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        child: Container(
          color: Colors.grey.shade200,
          // height: 70,
          child: ExpansionTileCard(
              key: key,
              leading: CircleAvatar(
                child: Image(image: AssetImage(image)),
              ),
              title: Text(text),
              elevation: 0,
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  // height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: widget),
                ),
              ]),
        ),
      );
  Widget columnTitle({String titleImage, String titleText}) => Padding(
        padding: EdgeInsets.only(
          left: 70,
          top: 8,
          bottom: 2,
        ),
        child: Container(
          height: 30,
          child: Row(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(
                        titleImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                width: 8,
              ),
              Text(
                titleText,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}
