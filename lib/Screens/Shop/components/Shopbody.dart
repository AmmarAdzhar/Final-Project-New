import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Fruit/Fruit_screen.dart';
import 'package:flutter_auth/Screens/Mainpage/Mainpage_screen.dart';
import 'package:flutter_auth/Screens/Meat/Meat_screen.dart';
import 'package:flutter_auth/Screens/Vegetables/Vegetables_screen.dart';

class ShopBody extends StatefulWidget {
  const ShopBody({Key? key}) : super(key: key);

  @override
  _ShopBodyState createState() => _ShopBodyState();
}

class _ShopBodyState extends State<ShopBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Column(children: [
      Flexible(
        flex: 10,
        child: Column(
          children: [
            Flexible(flex: 4, child: Container(color: Colors.purple)),
            Flexible(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WELCOME TO",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ME AND MARKET SHOP",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
          ],
        ),
      ),
      SizedBox(height: size.height * 0.05),
      Image.asset(
        "assets/images/Fruit.jpg",
        height: size.height * 0.15,
      ),
      ElevatedButton(
        child: const Text('FRUITS'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FruitScreen()));
        },
      ),
      Image.asset(
        "assets/images/Vegetables.jpg",
        height: size.height * 0.15,
      ),
      ElevatedButton(
        child: const Text('VEGETABLES'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => VegetablesScreen()));
        },
      ),
      Image.asset(
        "assets/images/Meat.jpg",
        height: size.height * 0.15,
      ),
      ElevatedButton(
        child: const Text('MEAT'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MeatScreen()));
        },
      ),
      SizedBox(
        height: 5,
      ),
      ElevatedButton(
        child: const Text('MAINPAGE'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MainpageScreen()));
        },
      ),
    ]));
  }
}
