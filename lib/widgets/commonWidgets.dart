import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/screens/profile/ProfileCubit.dart';
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

Widget CustomInputFilde(String lable, String data, dynamic devicesize,
    TextEditingController controller, BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(lable),
      ),
      Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          elevation: 1,
          shadowColor: Colors.black,
          color: Color(0xffF4F4F4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              //   controller: controller,
              initialValue: data,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid $lable!';
                }
              },
              onSaved: (value) {
                if (lable == 'Name')
                  ProfileCubit.get(context).CurrentUser.name = value;
                else if (lable == 'Email')
                  ProfileCubit.get(context).CurrentUser.email = value;
                else if (lable == 'Phone')
                  ProfileCubit.get(context).CurrentUser.phone = value;
              },
              decoration: InputDecoration(
                counterStyle: TextStyle(fontSize: 20, color: Color(0xff707070)),

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
      ),
    ],
  );
}
