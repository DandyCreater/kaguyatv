import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _isObsecure = false;
  bool _isObsecureConfirm = false;

  _obsecure() {
    _isObsecure = !_isObsecure;
    setState(() {});
  }

  _obsecureConfirm() {
    _isObsecureConfirm = !_isObsecureConfirm;
    setState(() {});
  }

  @override
  void initState() {
    _obsecureConfirm();
    _obsecure();
    // TODO: implement initState
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
              hintText: "Username/Email",
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

    Widget email() => TextField(
          controller: emailController,
          decoration: InputDecoration(
              fillColor: ColorManager.primaryTextField,
              filled: true,
              hintText: "Email",
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

    Widget passwordConfirmation() => TextField(
          controller: confirmPassController,
          obscureText: _isObsecureConfirm,
          decoration: InputDecoration(
              fillColor: ColorManager.primaryTextField,
              filled: true,
              hintText: "Password Confirmation",
              suffixIcon: GestureDetector(
                  onTap: _obsecureConfirm,
                  child: _isObsecureConfirm
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/logo_splashscreen.png")),
              username(),
              SizedBox(
                height: height * 0.02,
              ),
              email(),
              SizedBox(
                height: height * 0.02,
              ),
              password(),
              SizedBox(
                height: height * 0.02,
              ),
              passwordConfirmation(),
              SizedBox(
                height: height * 0.06,
              ),
              Text(
                "atau lanjutkan daftar dengan",
                style: GoogleFonts.robotoCondensed(
                    fontSize: 15,
                    color: ColorManager.whitePrimary,
                    fontWeight: FontWeightManager.light),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
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
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorManager.primaryTextField),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: Text(
                      "MASUK",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 15,
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeightManager.light),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
