import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Mainpage/Mainpage_screen.dart';
import '../../../config.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late double screenHeight, screenWidth;
  final focus = FocusNode();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  bool _passwordVisible = true;

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailditingController = TextEditingController();
  final TextEditingController _passEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  get http => null;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [upperHalf(context), lowerHalf(context)],
      ),
    );
  }

  Widget upperHalf(BuildContext context) {
    return Container(
      height: screenHeight / 2,
      width: screenWidth,
      child: Image.asset(
        'assets/images/Delivery.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Container(
        height: screenHeight / 2,
        width: screenWidth,
        margin: EdgeInsets.only(top: screenHeight / 5),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
            child: Column(children: [
          Card(
            elevation: 10,
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 10, 20, 25),
                child: Column(children: [
                  const Text(
                    "DELIVERY PROCESS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (val) => val!.isEmpty || (val.length < 3)
                          ? "name must be longer than 3"
                          : null,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus);
                      },
                      controller: _nameEditingController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          ))),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    validator: (val) => validatePassword(val.toString()),
                    focusNode: focus1,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focus2);
                    },
                    controller: _passEditingController,
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(),
                        labelText: 'Address',
                        icon: const Icon(Icons.map),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        )),
                    obscureText: _passwordVisible,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(screenWidth / 3, 50)),
                    child: const Text('BUY'),
                    onPressed: _registerAccountDialog,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(screenWidth / 3, 50)),
                    child: const Text('MAINPAGE'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MainpageScreen()));
                    },
                  ),
                ]),
              ),
            ),
          )
        ])));
  }

  String? validatePassword(String value) {
    // String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your address';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter a valid address';
      } else {
        return null;
      }
    }
  }

  void _registerAccountDialog() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Finished?",
            style: TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _registerUserAccount();
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

  void _registerUserAccount() {
    FocusScope.of(context).requestFocus(FocusNode());
    String _name = _nameEditingController.text;
    String _email = _emailditingController.text;
    String _pass = _passEditingController.text;
    FocusScope.of(context).unfocus();

    http.post(Uri.parse(Config.server + "/meandmarket/php/register_user.php"),
        body: {
          "name": _name,
          "email": _email,
          "password": _pass
        }).then((response) {
      print(response.body);
    });
  }
}
