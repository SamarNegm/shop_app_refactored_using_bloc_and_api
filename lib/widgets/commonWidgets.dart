import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/style.dart';

void showErrorDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('An Error Occurred!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        )
      ],
    ),
  );
}

Widget CustomInputFilde(String lable) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Text(lable, style: TextStyle(color: thierdltColor, fontSize: 14)),
        Spacer(),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          elevation: 4,
          shadowColor: Colors.black,
          color: Color(0xffF4F4F4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                counterStyle: TextStyle(fontSize: 20, color: Color(0xff707070)),
                labelText: lable,
                fillColor: Color(0xffF4F4F4),
                // border: OutlineInputBorder(
                //     borderRadius:
                //         BorderRadius.all(Radius.circular(30)
                //         )
                // )
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
