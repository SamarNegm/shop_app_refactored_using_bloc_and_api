import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/http_exception.dart';
import 'package:flutter_shop_app_refactored/models/users.dart';
import 'package:flutter_shop_app_refactored/providers/Users.dart';
import 'package:flutter_shop_app_refactored/providers/auth.dart';
import 'package:flutter_shop_app_refactored/screens/auth/authCubit.dart';
import 'package:flutter_shop_app_refactored/screens/auth/authState.dart';
import 'package:flutter_shop_app_refactored/screens/product_detail_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
//            decoration: BoxDecoration(
////              gradient: LinearGradient(
////                colors: [
////                  Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
////                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
////                ],
////                begin: Alignment.topLeft,
////                end: Alignment.bottomRight,
////                stops: [0, 1],
////              ),
//            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, bottom: 8, top: 20),
                        child: Text(
                          'Welcome to .., ',
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//                      transform: Matrix4.rotationZ(-8 * pi / 180)
//                        ..translate(-10.0),
//                      // ..translate(-10.0),
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image(
                              image: AssetImage('assets/images/logo.png'))),
                    ),
                  ),
                  AuthCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AnimationController _controller;
  Animation<Size> _heightAnimation;
  TextEditingController tecName = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecConfirm = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 260), end: Size(double.infinity, 320))
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _heightAnimation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopLoginCubit.get(context);
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 4),
            child: Text(
              cubit.authMode == AuthMode.Login ? 'Log in' : 'Sign up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56.0),
            ),
            elevation: 8.0,
            child: Container(
              // height: _authMode == AuthMode.Signup ? 320 : 260,
              height: deviceSize.height * 0.55,
              constraints:
                  BoxConstraints(minHeight: _heightAnimation.value.height),
              width: deviceSize.width,

              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: deviceSize.height * .5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        if (cubit.authMode == AuthMode.Signup)
                          TextFormField(
                            controller: tecName,
                            key: Key('t1'),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 12),
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.perm_identity)),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Invalid Name!';
                              }
                            },
                            onSaved: (value) {
                              cubit.loginModel.data.name = value;
                            },
                          ),
                        TextFormField(
                          controller: tecEmail,
                          key: Key('t2'),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              labelText: 'E-Mail',
                              prefixIcon: Icon(Icons.perm_identity)),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Invalid email!';
                            }
                          },
                          onSaved: (value) {
                            cubit.loginModel.data.email = value;
                          },
                        ),
                        TextFormField(
                          key: Key('t3'),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(cubit.suffix),
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(Icons.lock_outline)),
                          textInputAction: (cubit.authMode == AuthMode.Signup)
                              ? TextInputAction.next
                              : TextInputAction.done,
                          obscureText: cubit.isPassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value.isEmpty || value.length < 5) {
                              return 'Password is too short!';
                            }
                          },
                        ),
                        if (cubit.authMode == AuthMode.Signup)
                          TextFormField(
                            controller: tecConfirm,
                            key: Key('t4'),
                            enabled: cubit.authMode == AuthMode.Signup,
                            decoration: InputDecoration(
                              suffixIcon: Icon(cubit.suffix),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                            obscureText: true,
                            validator: cubit.authMode == AuthMode.Signup
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                  }
                                : null,
                          ),
                        SizedBox(
                          height: 60,
                        ),
                        if (state is ShopLoginLoadingState)
                          CircularProgressIndicator()
                        else
                          SizedBox(
                            height: 65,
                            width: deviceSize.width * 0.94,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 8.0),
                              child: ElevatedButton(
                                key: Key('rb1'),
                                child: Text(
                                  cubit.authMode == AuthMode.Login
                                      ? 'Sign in'
                                      : 'Sign up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                onPressed: () {
                                  print(tecEmail.text.toString() +
                                      '  ' +
                                      _passwordController.text);
                                  if (_formKey.currentState.validate()) {
                                    cubit.userLogin(
                                        email: tecEmail.text,
                                        password: _passwordController.text,
                                        context: context);
                                  }
                                },
                                style: ButtonStyle(
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(
                                            color: Theme.of(context)
                                                .primaryTextTheme
                                                .button
                                                .color)),
                                    backgroundColor: MaterialStateProperty.all(
                                        HexColor('#222831')),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ))),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            child: Text(
                              '${cubit.authMode == AuthMode.Login ? 'Sign up' : 'Sign in'} ',
                              style: TextStyle(
                                  color: HexColor('#222831'), fontSize: 24),
                            ),
                            onPressed: cubit.switchAuthMode,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }
}
