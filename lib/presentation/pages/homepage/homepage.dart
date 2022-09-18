import 'package:eko_projects/data/bloc/homepage-bloc/dorama-bloc/dorama_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/menu-bloc/menu_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/movie-bloc/movie_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/serial-bloc/serial_bloc.dart';
import 'package:eko_projects/data/bloc/homepage-bloc/streaming-bloc/streaming_bloc.dart';
import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:eko_projects/presentation/resources/routes_manager.dart';
import 'package:eko_projects/presentation/resources/strings_manager.dart';
import 'package:eko_projects/presentation/widget/at_homepage/dorama_menu_widget.dart';
import 'package:eko_projects/presentation/widget/at_homepage/menu_bar_widget.dart';
import 'package:eko_projects/presentation/widget/at_homepage/movie_menu_widget.dart';
import 'package:eko_projects/presentation/widget/at_homepage/serial_menu_widget.dart';
import 'package:eko_projects/presentation/widget/at_homepage/stream_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  SizedBox(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.042,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorManager.primaryButton)),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s12,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.semiBold),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.011,
                width: double.infinity,
                color: ColorManager.dividerColor,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/images/background.png',
                  width: double.infinity,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                  child: BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      if (state is MenuLoaded) {
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.okContentMenu!.menu!.length,
                            itemBuilder: ((context, index) {
                              var items = state.okContentMenu!.menu;
                              return MenuBarWidget(
                                imageUrl: items![index].imageUrl.toString(),
                                title: items[index].title.toString(),
                                press: () {
                                  Navigator.pushNamed(context, Routes.login);
                                },
                              );
                            }));
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  AppStrings.homepageTitle,
                  style: GoogleFonts.robotoCondensed(
                      color: ColorManager.whitePrimary,
                      fontSize: FontSize.s14,
                      fontWeight: FontWeightManager.regular),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Text(
                  AppStrings.homepageSubTitle,
                  style: GoogleFonts.robotoCondensed(
                      color: ColorManager.whitePrimary,
                      fontSize: FontSize.s24,
                      fontWeight: FontWeightManager.regular),
                ),
                SizedBox(height: screenHeight * 0.16),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "Live Streaming",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s20,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: BlocBuilder<StreamingBloc, StreamingState>(
                    builder: (context, state) {
                      if (state is StreamingLoaded) {
                        var items = state.okContentStream!.items;
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.okContentStream!.items!.length,
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  StreamingMenuWidget(
                                    imageUrl: items![index].imageUrl.toString(),
                                    title: items[index].title.toString(),
                                    duration: items[index].duration.toString(),
                                    press: () {
                                      Navigator.pushNamed(
                                          context, Routes.login);
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
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "Anime Serial",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s20,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
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
                  child: BlocBuilder<SerialBloc, SerialState>(
                    builder: (context, state) {
                      if (state is SerialLoaded) {
                        var items = state.okContentSerial!.serials;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.okContentSerial!.serials!.length,
                            itemBuilder: ((context, index) {
                              return Row(
                                children: [
                                  SerialMenuWidget(
                                    imageUrl: items![index].imageUrl.toString(),
                                    title: items[index].title.toString(),
                                    press: () {
                                      Navigator.pushNamed(
                                          context, Routes.login);
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
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "Dorama Serial",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s20,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
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
                  child: BlocBuilder<DoramaBloc, DoramaState>(
                    builder: (context, state) {
                      if (state is DoramaLoaded) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.okContentDorama!.dorama!.length,
                            itemBuilder: ((context, index) {
                              var items = state.okContentDorama!.dorama;
                              return Row(
                                children: [
                                  DoramaMenuWidget(
                                    imageUrl: items![index].imageUrl.toString(),
                                    title: items[index].title.toString(),
                                    press: () {
                                      Navigator.pushNamed(
                                          context, Routes.login);
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
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "Anime Movie",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: FontSize.s20,
                              color: ColorManager.whitePrimary,
                              fontWeight: FontWeightManager.regular),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
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
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieLoaded) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.okContentMovie!.movie!.length,
                            itemBuilder: ((context, index) {
                              var items = state.okContentMovie!.movie;
                              return Row(
                                children: [
                                  MovieMenuWidget(
                                    imageUrl: items![index].imageUrl.toString(),
                                    title: items[index].title.toString(),
                                    press: () {
                                      Navigator.pushNamed(
                                          context, Routes.login);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
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
            margin: EdgeInsets.only(top: screenHeight * 2),
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.007,
                  width: double.infinity,
                  color: ColorManager.dividerColor,
                ),
                SizedBox(
                  height: screenHeight * 0.2,
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
                            Navigator.pushNamed(context, Routes.login);
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
                            Navigator.pushNamed(context, Routes.login);
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
                            Navigator.pushNamed(context, Routes.login);
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
                            Navigator.pushNamed(context, Routes.login);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GradientText(
                              // ignore: prefer_interpolation_to_compose_strings
                              "FOLLOW ON",
                              style: GoogleFonts.robotoCondensed(
                                fontSize: FontSize.s14,
                              ),
                              colors: [
                                ColorManager.firstColorStyle,
                                ColorManager.secondColorStyle,
                                ColorManager.thirdColorStyle,
                                ColorManager.fourthColorStyle,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.login);
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
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: SizedBox(
                              height: screenHeight * 0.019,
                              width: screenWidth * 0.3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
        ]),
      ),
    );
  }
}
