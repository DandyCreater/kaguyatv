import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushNamed(context, Routes.homePage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Container(
          height: height * 0.4,
          width: width * 0.6,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/logo_splashscreen.png",
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
