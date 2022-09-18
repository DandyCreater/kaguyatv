import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/widget/at_user/user_custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.userBackgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.3,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/icons/user_profile.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              UserCustomMenuWidget(
                title: "Profile",
                imageUrl: "assets/icons/icon_user.svg",
                color: ColorManager.whitePrimary,
                press: () {
                  Navigator.pushNamed(context, '/undefined');
                },
              ),
              UserCustomMenuWidget(
                title: "Watchlist",
                imageUrl: "assets/icons/icon_watchlist.svg",
                color: ColorManager.whitePrimary,
                press: () {
                  Navigator.pushNamed(context, '/undefined');
                },
              ),
              UserCustomMenuWidget(
                title: "Watch History",
                imageUrl: "assets/icons/icon_history.svg",
                color: ColorManager.whitePrimary,
                press: () {
                  Navigator.pushNamed(context, '/undefined');
                },
              ),
              UserCustomMenuWidget(
                title: "Unsubscribe",
                imageUrl: "assets/icons/icon_unsubscribe.svg",
                color: ColorManager.primaryButton,
                press: () {
                  Navigator.pushNamed(context, '/undefined');
                },
              ),
              Divider(
                thickness: 2,
                color: ColorManager.dividerColor,
              ),
            ],
          )),
    );
  }
}
