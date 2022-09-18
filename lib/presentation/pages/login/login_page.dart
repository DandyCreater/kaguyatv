import 'dart:convert';

import 'package:eko_projects/data/bloc/auth-bloc/login-bloc/login_bloc.dart';
import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool _isObsecure = false;
  bool _isChecked = true;

  _obsecure() {
    _isObsecure = !_isObsecure;
    setState(() {});
  }

  _checked() {
    _isChecked = !_isChecked;
    setState(() {});
  }

  _showAlertDialog(BuildContext context, String message) {
    Widget acceptButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "OK",
        style: GoogleFonts.urbanist(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text(
          "Login Gagal",
          style: GoogleFonts.urbanist(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Text(
        message,
        style: GoogleFonts.urbanist(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        acceptButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  _loginCondition() {
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      _showAlertDialog(context, "Username Atau Password Tidak Boleh Kosong");
      usernameController.text = "";
      passwordController.text = "";
      setState(() {});
    } else {
      BlocProvider.of<LoginBloc>(context).add(LoadingProcess(
          username: usernameController.text.toString(),
          password: passwordController.text.toString()));
    }
  }

  @override
  void initState() {
    _obsecure();
    _checked(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget username() => TextField(
          controller: usernameController,
          decoration: InputDecoration(
              fillColor: ColorManager.primaryTextField,
              filled: true,
              hintText: "Username",
              hintStyle: GoogleFonts.robotoCondensed(
                  fontSize: 15,
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.w400),
              isDense: true,
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(20, 17, 20, 15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.primaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.primaryColor))),
        );

    Widget password() => TextField(
          controller: passwordController,
          obscureText: _isObsecure,
          decoration: InputDecoration(
              fillColor: ColorManager.primaryTextField,
              filled: true,
              hintText: "Password",
              suffixIcon: GestureDetector(
                  onTap: _obsecure,
                  child: _isObsecure
                      ? Icon(
                          Icons.visibility,
                          color: ColorManager.primaryColor,
                        )
                      : Icon(Icons.visibility_off,
                          color: ColorManager.primaryColor)),
              hintStyle: GoogleFonts.robotoCondensed(
                  fontSize: 15,
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.w400),
              isDense: true,
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 10, 5),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.primaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.primaryColor))),
        );

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            print("Login Loading Process");
          } else if (state is LoginLoaded) {
            print("Login Berhasil");
            Future.delayed(const Duration(seconds: 2)).then((value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.dashboard, (route) => false));
          } else if (state is LoginFailed) {
            _showAlertDialog(context, state.message!);
            usernameController.text = "";
            passwordController.text = "";
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset("assets/images/logo_splashscreen.png")),
                username(),
                SizedBox(
                  height: height * 0.02,
                ),
                password(),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _checked,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: ColorManager.primaryTextField,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: ColorManager.primaryColor),
                        ),
                        child: _isChecked
                            ? Icon(Icons.check,
                                color: ColorManager.primaryColor)
                            : Container(),
                      ),
                    ),
                    Text(
                      "Lupa Password",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 15,
                          fontWeight: FontWeightManager.light,
                          color: ColorManager.whitePrimary),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  child: Text(
                    "Daftar",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 15,
                        color: ColorManager.whitePrimary,
                        fontWeight: FontWeightManager.light),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "atau lanjutkan dengan",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 15,
                      color: ColorManager.whitePrimary,
                      fontWeight: FontWeightManager.light),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.07,
                      width: width * 0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icon_google.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icon_facebook.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: height * 0.07,
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorManager.primaryTextField),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                _loginCondition();

                // Navigator.pushNamed(context, Routes.dashboard);
              },
              child: Text(
                "MASUK",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 15,
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeightManager.light),
              )),
        ),
      ),
    );
  }
}
