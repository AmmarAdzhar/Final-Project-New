import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Cart/Cart.dart';

class MeatBody extends StatefulWidget {
  const MeatBody({Key? key}) : super(key: key);

  @override
  _MeatBodyState createState() => _MeatBodyState();
}

class _MeatBodyState extends State<MeatBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Column(
      children: [
        Flexible(
          flex: 4,
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " ME AND MARKET",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Image.asset(
          "assets/images/Meat.jpg",
          height: size.height * 0.45,
        ),
        SizedBox(
          height: 10,
        ),
        Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
              child: Column(
                children: [
                  const Center(
                    child: Text("TYPE OF MEATS",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Expanded(
                      child: ListView(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          shrinkWrap: true,
                          children: [
                        MaterialButton(
                          onPressed: _fruitDialog,
                          child: const Text("CHICKEN"),
                        ),
                        const Divider(
                          height: 2,
                        ),
                        MaterialButton(
                          onPressed: _fruitDialog,
                          child: const Text("COW"),
                        ),
                        const Divider(
                          height: 2,
                        ),
                        MaterialButton(
                          onPressed: _fruitDialog,
                          child: const Text("LAMB"),
                        ),
                        const Divider(
                          height: 2,
                        ),
                        MaterialButton(
                          onPressed: _fruitDialog,
                          child: const Text("FISH"),
                        ),
                        const Divider(
                          height: 2,
                        ),
                      ])),
                ],
              ),
            )),
      ],
    ));
  }

  void _fruitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Add to your cart?",
            style: TextStyle(),
          ),
          content: const Text(
            "Are you sure?",
            style: TextStyle(),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Cart()));
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
