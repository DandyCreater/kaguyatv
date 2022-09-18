import 'package:eko_projects/data/bloc/dashboard-bloc/serial-bloc/dashboard_serial_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/serial-bloc/serial_bloc.dart';
import 'package:eko_projects/data/bloc/play-bloc/related/related_play_bloc.dart';
import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:eko_projects/presentation/widget/at_play/custom_menu_play_widget.dart';
import 'package:eko_projects/presentation/widget/at_play/play_serial_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayPage extends StatefulWidget {
  String? title;
  String? subImageUrl;
  String? session;
  String? rating;
  String? description;
  String? genre;
  PlayPage(
      {Key? key,
      this.title,
      this.subImageUrl,
      this.description,
      this.genre,
      this.rating,
      this.session})
      : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: screenHeight * 0.1,
          backgroundColor: ColorManager.primaryColor,
          title: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    image: const DecorationImage(
                        image: AssetImage("assets/icons/logo.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.search,
                      size: 30,
                      color: ColorManager.whitePrimary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.user);
                      },
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.042,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image:
                                  AssetImage("assets/icons/user_profile.jpg"),
                              fit: BoxFit.cover,
                            ),
                            color: ColorManager.greyButton,
                            shape: BoxShape.circle),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              // ignore: curly_braces_in_flow_control_structures
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.subImageUrl.toString()),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: Container(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                      color: ColorManager.primaryButton,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.play_arrow,
                    color: ColorManager.whitePrimary,
                    size: 30,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Text(
                      widget.title.toString(),
                      style: GoogleFonts.robotoCondensed(
                          fontSize: FontSize.s20,
                          color: ColorManager.whitePrimary,
                          fontWeight: FontWeightManager.regular),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.session.toString(),
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s14,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "- Rating ${widget.rating}",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s14,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      widget.genre.toString(),
                      style: GoogleFonts.robotoCondensed(
                          fontSize: FontSize.s14,
                          color: ColorManager.blackhideColor,
                          fontWeight: FontWeightManager.regular),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      children: [
                        CustomPlayWidget(
                          imageUrl: "assets/icons/icon_watchlist.svg",
                          title: "Watchlist",
                          press: () {},
                          color: ColorManager.blackhideColor,
                        ),
                        SizedBox(
                          width: screenWidth * 0.07,
                        ),
                        CustomPlayWidget(
                          imageUrl: "assets/icons/icon_shared.svg",
                          title: "Share",
                          press: () {},
                          color: ColorManager.blackhideColor,
                        ),
                        SizedBox(
                          width: screenWidth * 0.07,
                        ),
                        CustomPlayWidget(
                          imageUrl: "assets/icons/icon_download.svg",
                          title: "Download",
                          press: () {},
                          color: ColorManager.activeColorButton,
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: FontSize.s18,
                          color: ColorManager.whitePrimary,
                          fontWeight: FontWeightManager.regular),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Text(
                      widget.description.toString(),
                      style: GoogleFonts.robotoCondensed(
                          fontSize: FontSize.s14,
                          color: ColorManager.blackhideColor,
                          fontWeight: FontWeightManager.regular),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      "Episode",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: FontSize.s20,
                          color: ColorManager.whitePrimary,
                          fontWeight: FontWeightManager.regular),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      height: screenHeight * 0.05,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              for (var i = 1; i < 15; i++)
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  height: screenHeight * 0.5,
                                  width: screenWidth * 0.085,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.primaryTextField),
                                  child: Center(
                                      child: (i < 10)
                                          ? Text("0$i")
                                          : Text(i.toString())),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          );
                        }),
                        itemCount: 1,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              "Related Videos",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: FontSize.s20,
                                  color: ColorManager.whitePrimary,
                                  fontWeight: FontWeightManager.regular),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/undefined');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "See All",
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: FontSize.s14,
                                    color: ColorManager.whitePrimary,
                                    fontWeight: FontWeightManager.regular),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/icon_right.svg',
                                height: 15,
                                width: 15,
                                color: ColorManager.primaryButton,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.001,
                    ),
                    SizedBox(
                      height: screenHeight * 0.27,
                      child: BlocBuilder<RelatedPlayBloc, RelatedPlayState>(
                        builder: (context, state) {
                          if (state is RelatedPlayLoaded) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    state.okContentRelated!.related!.length,
                                itemBuilder: ((context, index) {
                                  var items = state.okContentRelated!.related;
                                  return Row(
                                    children: [
                                      PlaySerialWidget(
                                        imageUrl:
                                            items![index].imageUrl.toString(),
                                        title: items[index].title.toString(),
                                        press: () {
                                          Navigator.pushNamed(
                                              context, '/undefined');
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  );
                                }));
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.1),
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.007,
                      width: double.infinity,
                      color: ColorManager.dividerColor,
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Center(
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: screenHeight * 0.022,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              width: screenWidth * 0.005,
                              color: ColorManager.dividerColor,
                            ))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Center(
                                child: Text("Feedback",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.whitePrimary,
                                      fontWeight: FontWeightManager.regular,
                                    )),
                              ),
                            ),
                          )),
                          Flexible(
                              child: Container(
                            height: screenHeight * 0.022,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              width: screenWidth * 0.005,
                              color: ColorManager.dividerColor,
                            ))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Center(
                                child: Text("Help",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.whitePrimary,
                                      fontWeight: FontWeightManager.regular,
                                    )),
                              ),
                            ),
                          )),
                          Flexible(
                              child: Container(
                            height: screenHeight * 0.022,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              width: screenWidth * 0.005,
                              color: ColorManager.dividerColor,
                            ))),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Center(
                                child: Text("FAQ",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: FontSize.s14,
                                      color: ColorManager.whitePrimary,
                                      fontWeight: FontWeightManager.regular,
                                    )),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/undefined');
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "FOLLOW ON",
                                  style: GoogleFonts.robotoCondensed(
                                    fontSize: FontSize.s14,
                                    color: ColorManager.transparentButton,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/undefined');
                                },
                                child: Container(
                                  height: screenHeight * 0.019,
                                  width: screenWidth * 0.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                    width: screenWidth * 0.005,
                                    color: ColorManager.dividerColor,
                                  ))),
                                  child: Center(
                                      child: SvgPicture.asset(
                                          'assets/icons/icon_facebook.svg',
                                          height: 24,
                                          width: 24)),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/undefined');
                                },
                                child: SizedBox(
                                  height: screenHeight * 0.019,
                                  width: screenWidth * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SvgPicture.asset(
                                          'assets/icons/icon_instagram.svg',
                                          height: 24,
                                          width: 24,
                                        )),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    Center(
                        child: Text("©2021 All rights reserved",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s14,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular,
                            ))),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
